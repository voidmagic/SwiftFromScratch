//
//  ViewController.swift
//  Project10-VideoPlayer
//
//  Created by VoidMagic on 2016/11/21.
//  Copyright © 2016年 VoidMagic. All rights reserved.
//

import UIKit
import AVFoundation
import SnapKit

class ViewController: UIViewController {
    
    private lazy var upperButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = UIScreen.main.bounds
        button.backgroundColor = UIColor(red:0.00, green:0.96, blue:1.00, alpha:1.0)
        button.setTitle("play video", for: .normal)
        return button
    }()
    
    private lazy var playerViewController: VideoPlayerViewController = {
        let playerVC = VideoPlayerViewController()
        return playerVC
    }()
    
    
    @objc private func playVideoButtonClicked() {
        if let videoURL = Bundle.main.url(forResource: "sample", withExtension: "mov") {
            showPlayer(url: videoURL)
        }
    }
    
    override func loadView() {
        view = UIView(frame: UIScreen.main.bounds)
        
        view.addSubview(upperButton)
        
        upperButton.addTarget(self, action: #selector(playVideoButtonClicked), for: .touchUpInside)
        
        prepareForPlayer()
        
    }
    
    private func prepareForPlayer() {
        if let window = UIApplication.shared.keyWindow {
            window.addSubview(playerViewController.view)
        }
    }
    
    // MARK: - Navigation function
    
    private func showPlayer(url: URL) {
        playerViewController.player = AVPlayer(url: url)
        playerViewController.state = .fullScreen
    }
}

