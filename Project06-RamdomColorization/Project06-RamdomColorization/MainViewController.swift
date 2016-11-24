//
//  MainViewController.swift
//  Project06-RandomColorization
//
//  Created by VoidMagic on 2016/11/15.
//  Copyright © 2016年 VoidMagic. All rights reserved.
//

import UIKit
import AVFoundation
import SnapKit

class MainViewController: UIViewController {

    // MARK: properties
    private lazy var audioPlayer: AVPlayer = {
        let bgMusic = Bundle.main.url(forResource: "Ecstasy", withExtension: "mp3")!
        let audioPlayer = AVPlayer(url: bgMusic)
        return audioPlayer
    }()
    
    private lazy var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        let color1 = UIColor(white: 0.5, alpha: 0.2).cgColor
        let color2 = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.4).cgColor
        let color3 = UIColor(red: 0, green: 1, blue: 0, alpha: 0.3).cgColor
        let color4 = UIColor(red: 0, green: 0, blue: 1, alpha: 0.3).cgColor
        let color5 = UIColor(white: 0.4, alpha: 0.2).cgColor
        
        gradientLayer.colors = [color1, color2, color3, color4, color5]
        gradientLayer.locations = [0.10, 0.30, 0.50, 0.70, 0.90]
        gradientLayer.startPoint = CGPoint.zero
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        return gradientLayer
    }()
    
    private var timer: Timer?
    
    private lazy var playButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "music play"), for: .normal)
        button.addTarget(self, action: #selector(playButtonClicked), for: .touchUpInside)
        return button
    }()

    // MARK: status bar hidden
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(playButton)
        self.view.layer.addSublayer(gradientLayer)
        
        view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        playButton.snp.makeConstraints {
            maker in
            maker.center.equalTo(view.snp.center)
        }
    }

    // MARK: action handler
    @objc private func playButtonClicked() {
        if audioPlayer.rate != 0 && audioPlayer.error == nil {
            // is playing
            audioPlayer.pause()
            timer?.invalidate()
            timer = nil
        } else if audioPlayer.rate == 0 && audioPlayer.error == nil {
            audioPlayer.play()
            
            timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) {
                _ in
                
                let redValue = CGFloat(drand48())
                let blueValue =  CGFloat(drand48())
                let greenValue = CGFloat(drand48())
                
                self.view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
            }
        }
    }
}

