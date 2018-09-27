//
//  ViewController.swift
//  SelectImages
//
//  Created by Togami Yuki on 2018/09/27.
//  Copyright © 2018 Togami Yuki. All rights reserved.
//

import UIKit
import ELCImagePickerController

class collectionViewCell:UICollectionViewCell{
    @IBOutlet weak var collectionViewCellImage: UIImageView!
}


class ViewController: UIViewController,ELCImagePickerControllerDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    var pickedImages:[UIImage] = []
    var MaxNum:Int = 20
    var margin:CGFloat = 3.0
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
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
        picker.maximumImagesCount = MaxNum  // 選択する最大枚数
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
        
        for any in info {
            let dict = any as! NSMutableDictionary
            let image = dict.object(forKey: UIImagePickerControllerOriginalImage) as! UIImage
            pickedImages.append(image)
        }
        collectionView.reloadData()
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
        return pickedImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! collectionViewCell
        
        cell.collectionViewCellImage.image = pickedImages[indexPath.row]
        
        return cell
    }
    
    //セルのサイズ指定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewWidth = collectionView.frame.width
        let cellNum:CGFloat = 3
        let cellSize = (collectionViewWidth - margin * (cellNum + 2))/cellNum
        
        return CGSize(width: cellSize, height: cellSize)
    }
    //セル同士の縦の間隔を決める。
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return margin
    }
    //セル同士の横の間隔を決める。
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return margin
    }


}

