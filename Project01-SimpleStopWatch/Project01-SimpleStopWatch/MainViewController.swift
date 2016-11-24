//
//  MainViewController.swift
//  Project01-SimpleStopWatch
//
//  Created by VoidMagic on 2016/11/10.
//  Copyright © 2016年 VoidMagic. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    private lazy var timeLabel: UILabel = {
        let timeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height/2))
        timeLabel.backgroundColor = UIColor.orange
        timeLabel.font = UIFont(name: "Courier New", size: 120)
        timeLabel.textColor = UIColor.darkGray
        return timeLabel
    }()
    
    private lazy var stopButton: UIButton = {
        let stopButton = UIButton(frame: CGRect(x: self.view.frame.width/2, y: self.view.frame.height/2, width: self.view.frame.width/2, height: self.view.frame.height/2))
        if let stopButtonImage = UIImage(named: ImageNameConstants.stopButtonImageName) {
            stopButton.setImage(stopButtonImage, for: .normal)
            stopButton.backgroundColor = UIColor.green
        }
        stopButton.addTarget(self, action: #selector(self.stopButtonClicked), for: .touchUpInside)
        return stopButton
    }()
    
    
    private lazy var startButton: UIButton = {
        let startButton = UIButton(frame: CGRect(x: 0, y: self.view.frame.height/2, width: self.view.frame.width/2, height: self.view.frame.height/2))
        if let startButtonImage = UIImage(named: ImageNameConstants.startButtonImageName) {
            startButton.setImage(startButtonImage, for: .normal)
            startButton.backgroundColor = UIColor.purple
        }
        startButton.addTarget(self, action: #selector(self.startButtonClicked), for: .touchUpInside)
        return startButton
    }()
    
    private lazy var resetButton: UIButton = {
        let resetButton = UIButton(type: .system)
        resetButton.setTitle("Reset", for: .normal)
        resetButton.addTarget(self, action: #selector(self.resetButtonClicked), for: .touchUpInside)
        return resetButton
    }()
    
    private var timeValue: Double = 0.0 {
        didSet {
            timeLabel.text = String(format: "%.1f", timeValue)
            timeLabel.textAlignment = .center
        }
    }
    
    private var timer: Timer?
    
    private struct ImageNameConstants {
        static let stopButtonImageName = "Stop Image"
        static let startButtonImageName = "Start Image"
        private init() {}
    }
    
    override func loadView() {
        view = UIView(frame: UIScreen.main.bounds)
        
        view.addSubview(startButton)
        view.addSubview(stopButton)
        view.addSubview(timeLabel)
        view.addSubview(resetButton)
        
        view.setNeedsUpdateConstraints()
        
        timeValue = 0.0
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        resetButton.snp.makeConstraints {
            maker in
            maker.top.equalTo(view).offset(30)
            maker.right.equalTo(view).offset(-30)
        }
    }
    
    @objc private func resetButtonClicked() {
        stopButtonClicked()
        timeValue = 0.0
    }
    
    @objc private func startButtonClicked() {
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) {
                _ in self.timeValue += 0.1
            }
        }
    }
    @objc private func stopButtonClicked() {
        timer?.invalidate()
        timer = nil
    }
}

