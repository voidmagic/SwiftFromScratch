//
//  MainViewController.swift
//  Project05-PhotoPicker
//
//  Created by VoidMagic on 2016/11/14.
//  Copyright © 2016年 VoidMagic. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    private lazy var imageArea: UIImageView = {
        
        
        let height = self.view.bounds.height.divided(by: 2)
        let width = self.view.bounds.width
        let hw = CGFloat.minimum(height, width)
        let imageArea = UIImageView(frame: CGRect(x: (width-hw)/2, y: 40, width: CGFloat.minimum(height, width), height: CGFloat.minimum(height, width)))
        imageArea.isUserInteractionEnabled = true
        imageArea.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectImageClicked)))
        imageArea.backgroundColor = UIColor.orange
        imageArea.layer.masksToBounds = true
        imageArea.layer.cornerRadius = hw.divided(by: 2)
        return imageArea
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageArea)
    }
    
    
    @objc private func selectImageClicked() {
        let alert = UIAlertController(title: "更换头像", message: nil, preferredStyle: .actionSheet)
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            alert.addAction(UIAlertAction(title: "拍照", style: .default, handler: self.takePhoto))
        }
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            alert.addAction(UIAlertAction(title: "从相册选取", style: .default, handler: self.selectFromAlbum))
        }
        alert.addAction(UIAlertAction(title: "取消", style: .cancel) {_ in alert.dismiss(animated: true, completion: nil)})
        present(alert, animated: true, completion: nil)
    }
    
    private func takePhoto(action: UIAlertAction) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = UIImagePickerControllerSourceType.camera
        self.present(picker, animated: true, completion: nil)
    }
    
    private func selectFromAlbum(action: UIAlertAction) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        imageArea.image = info["UIImagePickerControllerOriginalImage"] as? UIImage
        
        picker.dismiss(animated: true, completion: nil)
    }
    
}

