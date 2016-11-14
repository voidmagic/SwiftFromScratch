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
    
    private var imageArea: UIImageView! {
        didSet {
            imageArea.isUserInteractionEnabled = true
            imageArea.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectImageClicked)))
            imageArea.backgroundColor = UIColor.orange
            imageArea.layer.masksToBounds = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    private func initView() {
        initImageArea()
    }
    
    private func initImageArea() {
        imageArea = UIImageView()
        
        view.addSubview(imageArea)
        imageArea.snp.makeConstraints {
            maker in
            let height = view.bounds.height.divided(by: 2)
            let width = view.bounds.width
            maker.centerX.equalTo(view.snp.centerX)
            maker.width.equalTo(CGFloat.minimum(height, width))
            maker.height.equalTo(CGFloat.minimum(height, width))
            maker.top.equalTo(view.snp.top).offset(UIApplication.shared.statusBarFrame.height)
            imageArea.layer.cornerRadius = CGFloat.minimum(height, width).divided(by: 2)
        }
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
        var keyName = ""
        
        switch picker.sourceType {
        case .camera:
            keyName = "UIImagePickerControllerOriginalImage"
        case .photoLibrary:
            keyName = "UIImagePickerControllerOriginalImage"
        case .savedPhotosAlbum:
            break
        }
        
        if let image = info[keyName] as? UIImage {
            imageArea.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
}

