//
//  MainViewController.swift
//  Project12-Moments
//
//  Created by VoidMagic on 2016/11/23.
//  Copyright © 2016年 VoidMagic. All rights reserved.
//

import UIKit
import ImagePicker

class MainViewController: UIViewController, UITextViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, ImagePickerDelegate {
    
    private lazy var textView: UITextView = {
        let textView = UITextView(frame: CGRect(x: 0, y: 10, width: self.view.frame.width, height: self.view.frame.height/4))
        textView.delegate = self
        textView.showsVerticalScrollIndicator = false
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.autocorrectionType = .no
        return textView
    }()
    
    
    private lazy var photoCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let frame = CGRect(x: 0, y: self.view.frame.height/4 + 20, width: self.view.frame.width, height: self.view.frame.height/4)
        let collection = UICollectionView(frame: frame, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = UIColor.clear
        return collection
    }()
    

    private var imagesData = [UIImage]() {
        didSet {
            if imagesData.count < 4 {
                photoCollection.frame = CGRect(x: 0, y: self.view.frame.height/4 + 20, width: self.view.frame.width, height: self.view.frame.height/8)
            } else if imagesData.count < 8 {
                photoCollection.frame = CGRect(x: 0, y: self.view.frame.height/4 + 20, width: self.view.frame.width, height: self.view.frame.height/4)
            } else if imagesData.count < 10 {
                photoCollection.frame = CGRect(x: 0, y: self.view.frame.height/4 + 20, width: self.view.frame.width, height: self.view.frame.height/8*3)
            } else {
                // something wrong
            }
            photoCollection.reloadData()
        }
    }
    
    override func loadView() {
        view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor.white
        
        navigationItem.setRightBarButton(UIBarButtonItem(title: "Send", style: .done, target: self, action:  #selector(done)), animated: true)
        
        view.addSubview(textView)
        setPlaceholder("Say Something...", for: textView)
        
        photoCollection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.addSubview(photoCollection)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        textView.resignFirstResponder()
    }
    
    
    // MARK: text view
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = textView.text ?? ""
        let newLength = currentText.characters.count + text.characters.count - range.length
        return newLength < 140
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        if textView.text.characters.count == 0 {
            setPlaceholder("Say Something...", for: textView)
        }
        return true
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        if textView.textColor == UIColor.lightGray {
            textView.textColor = UIColor.gray
            textView.text = ""
        }
        return true
    }
    
    // MARK: collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesData.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let imageView = UIImageView(frame: cell.bounds)
        cell.contentView.addSubview(imageView)
        if indexPath.row == imagesData.count {
            imageView.image = #imageLiteral(resourceName: "add")
        } else {
            imageView.image = imagesData[indexPath.row]
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/4-20, height: collectionView.frame.width/4-20)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        present(imagePickerController, animated: true, completion: nil)
    }
    
    // MARK: image picker
    private lazy var imagePickerController: ImagePickerController = { [unowned self] in
        let picker = ImagePickerController()
        picker.delegate = self
        picker.imageLimit = 9
        return picker
    }()
    
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        imagesData = images
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    public func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        // do nothing
    }
    public func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        imagesData.removeAll()
    }
    
    
    // MARK: function
    func setPlaceholder(_ content: String, for textView: UITextView) {
        textView.text = content
        textView.textColor = UIColor.lightGray
    }
    
    // MARK: navigation bar action
    @objc private func done() {
        // do something
    }
}
