//
//  MainViewController.swift
//  Project06-RamdomColorization
//
//  Created by VoidMagic on 2016/11/15.
//  Copyright © 2016年 VoidMagic. All rights reserved.
//

import UIKit
import AVFoundation
import SnapKit

class MainViewController: UIViewController {

    
    private var audioPlayer = AVAudioPlayer()
    
    private let gradientLayer = CAGradientLayer()
    
    private var timer: Timer?
    
    private let playButton = UIButton()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.isStatusBarHidden = true
        
        initView()
    }
    
    private func initView() {
        addPlayButton()
        initBackground()
    }
    
    private func initBackground() {
        gradientLayer.frame = view.bounds
        let color1 = UIColor(white: 0.5, alpha: 0.2).cgColor
        let color2 = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.4).cgColor
        let color3 = UIColor(red: 0, green: 1, blue: 0, alpha: 0.3).cgColor
        let color4 = UIColor(red: 0, green: 0, blue: 1, alpha: 0.3).cgColor
        let color5 = UIColor(white: 0.4, alpha: 0.2).cgColor
        
        gradientLayer.colors = [color1, color2, color3, color4, color5]
        gradientLayer.locations = [0.10, 0.30, 0.50, 0.70, 0.90]
        gradientLayer.startPoint = CGPoint.zero
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        self.view.layer.addSublayer(gradientLayer)
    }
    
    private func addPlayButton() {
        playButton.setImage(UIImage(named: "music play"), for: .normal)
        playButton.addTarget(self, action: #selector(playButtonClicked), for: .touchUpInside)
        view.addSubview(playButton)
        
        playButton.snp.makeConstraints {
            maker in
            maker.center.equalTo(view.snp.center)
        }
    }
    
    @objc private func playButtonClicked() {
        let bgMusic = NSURL(fileURLWithPath: Bundle.main.path(forResource: "Ecstasy", ofType: "mp3")!)
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            try audioPlayer = AVAudioPlayer(contentsOf: bgMusic as URL)
            
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            
        } catch let audioError as NSError {
            print(audioError)
        }
        if (timer == nil) {
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

