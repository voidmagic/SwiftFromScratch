//
//  ViewController.swift
//  Project02-TipCalculator
//
//  Created by VoidMagic on 2016/11/11.
//  Copyright © 2016年 VoidMagic. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private var topHeight: CGFloat!
    
    private lazy var costTextField: UITextField = {
        let costTF = UITextField()
        costTF.placeholder = "$0.00"
        costTF.font = UIFont.systemFont(ofSize: 60)
        costTF.textAlignment = .right
        costTF.keyboardType = .numberPad
        costTF.addTarget(self, action: #selector(MainViewController.costTextFieldDidChange(textField:)), for: .editingChanged)
        return costTF
    }()
    
    private lazy var tipLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = SomeConstants.font
        label.textColor = SomeConstants.fontColor
        return label
    }()
    
    private lazy var tipValueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = SomeConstants.font
        label.textColor = SomeConstants.fontColor
        return label
    }()
    
    private lazy var totalValueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = SomeConstants.font
        label.textColor = SomeConstants.fontColor
        return label
    }()
    
    private lazy var totalTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.text = "Total:"
        label.font = SomeConstants.font
        label.textColor = SomeConstants.fontColor
        return label
    }()
    
    
    private lazy var slider: UISlider = {
        let slider = UISlider()
        slider.maximumValue = 100
        slider.minimumValue = 0
        slider.value = 15
        slider.addTarget(self, action: #selector(self.tipPickerChanged(picker:)), for: .valueChanged)
        return slider
    }()
    
    private var _cost = 0.0
    private var cost: Double {
        set {
            _cost = newValue
            calculateTotal()
        }
        get {
            return _cost
        }
    }
    
    private var _tipRate: Int = 15
    private var tipRate: Int {
        get {
            return _tipRate
        }
        set {
            _tipRate = newValue
            calculateTotal()
        }
    }
    
    private func calculateTotal() {
        let tipValue = cost * Double(tipRate) / 100.0
        tipLabel.text = "Tip(\(tipRate)%):"
        tipValueLabel.text = "$\(tipValue)"
        totalValueLabel.text = "$\(tipValue + cost)"
    }
    
    private struct SomeConstants {
        static let font: UIFont = UIFont.systemFont(ofSize: 20)
        static let fontColor: UIColor = UIColor.purple
        private init() {}
    }
  
    
    override func loadView() {
        view = UIView(frame: UIScreen.main.bounds)
        
        topHeight = navigationController!.navigationBar.frame.height + UIApplication.shared.statusBarFrame.height
        navigationItem.title = "Tip Calculator"
        initView()
        
        tipRate = 15
    }
    
    private func initView() {
        view.addSubview(costTextField)
        view.addSubview(tipLabel)
        view.addSubview(tipValueLabel)
        view.addSubview(totalTextLabel)
        view.addSubview(totalValueLabel)
        view.addSubview(slider)
        
        view.setNeedsUpdateConstraints()
    }
    
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        costTextField.snp.makeConstraints {
            maker in
            maker.top.equalTo(view.snp.top).offset(topHeight)
            maker.left.equalTo(view.snp.centerX)
            maker.right.equalTo(view.snp.right)
            maker.height.equalTo((view.bounds.height-topHeight)/4)
        }
        tipLabel.snp.makeConstraints {
            maker in
            maker.left.equalTo(costTextField.snp.left)
            maker.right.equalTo(view.snp.right).offset(-view.bounds.width/4)
            maker.top.equalTo(costTextField.snp.bottom)
            maker.height.equalTo((view.bounds.height-topHeight)/8)
        }
        tipValueLabel.snp.makeConstraints {
            maker in
            maker.left.equalTo(tipLabel.snp.right)
            maker.top.equalTo(tipLabel.snp.top)
            maker.size.equalTo(tipLabel.snp.size)
        }
        totalTextLabel.snp.makeConstraints {
            maker in
            maker.left.equalTo(tipLabel.snp.left)
            maker.top.equalTo(tipLabel.snp.bottom)
            maker.size.equalTo(tipLabel.snp.size)
        }
        
        totalValueLabel.snp.makeConstraints {
            maker in
            maker.top.equalTo(tipLabel.snp.bottom)
            maker.left.equalTo(tipLabel.snp.right)
            maker.size.equalTo(tipLabel.snp.size)
        }

        slider.snp.makeConstraints {
            maker in
            maker.top.equalTo(totalValueLabel.snp.bottom)
            maker.left.equalTo(view.snp.left).offset(20)
            maker.right.equalTo(view.snp.right).offset(-20)
            maker.height.equalTo(20)
        }
    }

    
    @objc private func tipPickerChanged(picker: UISlider) {
        costTextField.resignFirstResponder()
        tipRate = Int(picker.value)
    }
    
    @objc private func costTextFieldDidChange(textField: UITextField) {
        cost = Double(textField.text ?? "") ?? 0.0
    }
}

