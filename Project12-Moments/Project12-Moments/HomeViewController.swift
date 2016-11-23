//
//  HomeViewController.swift
//  Project12-Moments
//
//  Created by VoidMagic on 2016/11/23.
//  Copyright © 2016年 VoidMagic. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var momentsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(#imageLiteral(resourceName: "photo"), for: .normal)
        button.sizeToFit()
        return button
    }()
    
    override func loadView() {
        view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor.white
        
        view.addSubview(momentsButton)
        momentsButton.center = view.center
        
        momentsButton.addTarget(self, action: #selector(HomeViewController.pushNextViewController), for: .touchUpInside)
        
        self.navigationItem.title = "Moments"
    }
    
    @objc private func pushNextViewController() {
        let destination = MainViewController()
        navigationController?.pushViewController(destination, animated: true)
    }


}

