//
//  ViewController.swift
//  Project13-LimitCharacters
//
//  Created by VoidMagic on 2016/11/23.
//  Copyright © 2016年 VoidMagic. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    private lazy var textView: UITextView = {
        let textView = UITextView(frame: CGRect(x: 0, y: 50, width: self.view.frame.width, height: self.view.frame.height/4))
        textView.delegate = self
        textView.isScrollEnabled = false
        textView.font = UIFont.systemFont(ofSize: 25)
        textView.autocorrectionType = .no
        return textView
    }()
    
    private lazy var charCountLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        label.text = "140"
        label.textColor = UIColor.blue
        return label
    }()
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @objc private func blankTap() {
        textView.endEditing(true)
    }
    
    override func loadView() {
        view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor.white
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(blankTap)))
        
        view.addSubview(charCountLabel)
        
        view.addSubview(textView)
    
        setPlaceholder(nil, for: textView)
    }
    
    private func setPlaceholder(_ content: String?, for textView: UITextView) {
        let text = content ?? "Say Something..."
        textView.text = text
        textView.textColor = UIColor.lightGray
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let myTextViewString = textView.text ?? ""
        let newLength = myTextViewString.characters.count - range.length + text.characters.count
        let maxCount = 140
        if newLength <= maxCount {
            charCountLabel.text = "\(maxCount - newLength)"
            return true
        } else {
            charCountLabel.text = "\(maxCount - myTextViewString.characters.count)"
            return false
        }
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        if textView.textColor == UIColor.lightGray {
            textView.textColor = UIColor.gray
            textView.text = ""
        }
        return true
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        if textView.text.characters.count == 0 {
            setPlaceholder(nil, for: textView)
        }
        return true
    }

    
}

