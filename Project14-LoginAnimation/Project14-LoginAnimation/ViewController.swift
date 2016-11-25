//
//  ViewController.swift
//  Project14-LoginAnimation
//
//  Created by 王迁 on 2016/11/24.
//  Copyright © 2016年 王迁. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var usernameLabel: UILabel = {
        let width = self.view.frame.width.multiplied(by: 0.8)
        let height: CGFloat = 40.0
        let x = self.view.frame.width.multiplied(by: 0.1)
        let y: CGFloat = 40.0
        let label = UILabel(frame: CGRect(x: x, y: y, width: width, height: height))
        label.backgroundColor = UIColor.white
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        label.textColor = UIColor.lightGray
        label.text = "username"
        return label
    }()
    
    private lazy var passwordLabel: UILabel = {
        let width = self.view.frame.width.multiplied(by: 0.8)
        let height: CGFloat = 40.0
        let x = self.view.frame.width.multiplied(by: 0.1)
        let y: CGFloat = 124.0
        let label = UILabel(frame: CGRect(x: x, y: y , width: width, height: height))
        label.backgroundColor = UIColor.white
        label.textColor = UIColor.lightGray
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        label.text = "password"
        return label
    }()
    
    override func loadView() {
        view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor.green
        
        view.addSubview(usernameLabel)
        view.addSubview(passwordLabel)
    }

}

