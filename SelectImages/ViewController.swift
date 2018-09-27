//
//  ViewController.swift
//  SelectImages
//
//  Created by Togami Yuki on 2018/09/27.
//  Copyright © 2018 Togami Yuki. All rights reserved.
//

import UIKit
import ELCImagePickerController

class ViewController: UIViewController,ELCImagePickerControllerDelegate,UICollectionViewDelegate,UICollectionViewDataSource{
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func SelectImages(_ sender: UIButton) {
        pickImages()
        print("写真選択画面表示")
    }

    
/*-----------------------------------------*/
//ライブラリから画像を複数選択するコード
/*-----------------------------------------*/
    
    //写真を選択画面の表示
    func pickImages() {
        var picker = ELCImagePickerController()
        picker.maximumImagesCount = 5  // 選択する最大枚数
        picker.imagePickerDelegate = self
        present(picker, animated: true, completion: nil)
    }
    
    
    //写真選択時に呼び出される
    func elcImagePickerController(_ picker: ELCImagePickerController!, didFinishPickingMediaWithInfo info: [Any]!) {
        //前の画面に戻る
        self.dismiss(animated: true, completion: nil)
        if (info.count == 0) {
            return
        }
        var pickedImages = [UIImage]()
        for any in info {
            let dict = any as! NSMutableDictionary
            let image = dict.object(forKey: UIImagePickerControllerOriginalImage) as! UIImage
            pickedImages.append(image)
        }
        print(pickedImages)
    }
    
    
    //写真未選択時に呼び出される
    func elcImagePickerControllerDidCancel(_ picker: ELCImagePickerController!) {
        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
/*-----------------------------------------*/
//CollectionViewに関するコード
/*-----------------------------------------*/
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }


}

