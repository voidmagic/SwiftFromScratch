//
//  MainViewController.swift
//  Project01-SimpleStopWatch
//
//  Created by 王迁 on 2016/11/10.
//  Copyright © 2016年 王迁. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    private var timeLabel = UILabel()
    private var stopButton = UIButton()
    private var startButton = UIButton()
    private var resetButton = UIButton(type: .system)
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    private func initView() {
        view.backgroundColor = UIColor.white
        
        addTimeLabel()
        addStopButton()
        addStartButton()
        addResetButton()
     
        timeValue = 0.0
    }
    
    private func addTimeLabel() {
        timeLabel.backgroundColor = UIColor.orange
        
        view.addSubview(timeLabel)
        
        timeLabel.font = UIFont(name: "Courier New", size: 120)
        timeLabel.textColor = UIColor.darkGray
        timeLabel.snp.makeConstraints {
            maker in
            maker.top.equalTo(view.snp.top)
            maker.bottom.equalTo(view.snp.centerY)
            maker.left.equalTo(view.snp.left)
            maker.right.equalTo(view.snp.right)
        }
    }
    
    
    private func addStartButton() {
        
        if let startButtonImage = UIImage(named: ImageNameConstants.startButtonImageName) {
            startButton.setImage(startButtonImage, for: .normal)
            startButton.backgroundColor = UIColor.purple
        } else {
            // could never happen as we are sure that the image exist.
            startButton = UIButton(type: .system)
            startButton.setTitle("Stop", for: .normal)
        }
        startButton.addTarget(self, action: #selector(self.startButtonClicked), for: .touchUpInside)
        view.addSubview(startButton)
        startButton.snp.makeConstraints {
            maker in
            maker.left.equalTo(view.snp.left)
            maker.top.equalTo(view.snp.centerY)
            maker.right.equalTo(view.snp.centerX)
            maker.bottom.equalTo(view.snp.bottom)
        }
    }
    
    private func addStopButton() {
        if let stopButtonImage = UIImage(named: ImageNameConstants.stopButtonImageName) {
            stopButton.setImage(stopButtonImage, for: .normal)
            stopButton.backgroundColor = UIColor.green
        } else {
            // could never happen as we are sure that the image exist.
            stopButton = UIButton(type: .system)
            stopButton.setTitle("Stop", for: .normal)
        }
        
        stopButton.addTarget(self, action: #selector(self.stopButtonClicked), for: .touchUpInside)
        
        view.addSubview(stopButton)
        stopButton.snp.makeConstraints {
            maker in
            maker.right.equalTo(view.snp.right)
            maker.top.equalTo(view.snp.centerY)
            maker.left.equalTo(view.snp.centerX)
            maker.bottom.equalTo(view.snp.bottom)
        }
    }
    
    private func addResetButton() {
        resetButton.setTitle("Reset", for: .normal)
        resetButton.addTarget(self, action: #selector(self.resetButtonClicked), for: .touchUpInside)
        view.addSubview(resetButton)
        
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

