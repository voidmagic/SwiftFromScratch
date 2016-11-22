//
//  VideoPlayerViewController.swift
//  Project10-VideoPlayer
//
//  Created by VoidMagic on 2016/11/22.
//  Copyright © 2016年 VoidMagic. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoPlayerViewController: UIViewController {

    enum State {
        case minimized
        case fullScreen
        case hidden
    }
    
    var state: State = .hidden {
        didSet {
            animate()
        }
    }
    
    private func animate() {
        UIApplication.shared.keyWindow?.bringSubview(toFront: self.view)
        switch state {
        case .fullScreen:
            viewWillEnterFullscreen()
        case .hidden:
            viewWillBecomeHidden()
        case .minimized:
            viewWillBecomeMinimize()
        }
    }
    
    
    private func viewWillEnterFullscreen() {
        UIView.animate(withDuration: 0.3) {
            self.view.transform = CGAffineTransform.identity
        }
        
        player.play()
        
        
    }
    
    private func viewWillBecomeHidden() {
        UIView.animate(withDuration: 0.3) {
            self.view.transform = CGAffineTransform(scaleX: 0.4, y: 0.4).concatenating(CGAffineTransform(translationX: -self.view.bounds.width, y: self.view.bounds.height/4))
        }
        player.pause()
    }
    
    private func viewWillBecomeMinimize() {
        UIView.animate(withDuration: 0.3) {
            self.view.transform = CGAffineTransform(scaleX: 0.4, y: 0.4).concatenating(CGAffineTransform(translationX: self.view.bounds.width/4, y: self.view.bounds.height/4))
        }
        player.play()
    }
    
    private var playLayer = AVPlayerLayer()
    
    var player: AVPlayer = AVPlayer() {
        didSet {
            playLayer.removeFromSuperlayer()
            playLayer = AVPlayerLayer(player: player)
            playLayer.frame = view.bounds
            view.layer.addSublayer(playLayer)
        }
    }
    
    @objc private func swipToMinimize() {
        if state == .fullScreen {
            state = .minimized
        }
    }
    
    @objc private func swipToHidden() {
        if state == .minimized {
            state = .hidden
        }
    }
    
    @objc private func tapToFullscreen() {
        if state == .minimized {
            state = .fullScreen
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gestureDown = UISwipeGestureRecognizer(target: self, action: #selector(swipToMinimize))
        let gestureLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipToHidden))
        let gestureTap = UITapGestureRecognizer(target: self, action: #selector(tapToFullscreen))
        gestureDown.direction = .down
        view.addGestureRecognizer(gestureDown)
        gestureLeft.direction = .left
        view.addGestureRecognizer(gestureLeft)
        view.addGestureRecognizer(gestureTap)
    }
    
}
