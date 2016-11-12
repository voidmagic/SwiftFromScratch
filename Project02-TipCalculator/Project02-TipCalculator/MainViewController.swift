//
//  ViewController.swift
//  Project02-TipCalculator
//
//  Created by 王迁 on 2016/11/11.
//  Copyright © 2016年 王迁. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private var topHeight: CGFloat!
    
    private let costTextField = UITextField()
    
    private let tipLabel = UILabel()
    private let tipValueLabel = UILabel()
    
    private let totalValueLabel = UILabel()
    
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
        
        tipLabel.text = "Tip(\(tipRate)%):"
        let tipValue = cost * Double(tipRate) / 100.0
        tipValueLabel.text = "$\(tipValue)"
        totalValueLabel.text = "$\(tipValue + cost)"
    }
    
    private struct SomeConstants {
        static let titleBackgroundColor: UIColor = UIColor.lightGray
        static let textViewFont: UIFont = UIFont.systemFont(ofSize: 60)
        static let title: String = "Tip Calculator"
        static let font: UIFont = UIFont.systemFont(ofSize: 20)
        static let fontColor: UIColor = UIColor.purple
        private init() {}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topHeight = navigationController!.navigationBar.frame.height + UIApplication.shared.statusBarFrame.height
        navigationItem.title = SomeConstants.title
        initView()
        
        tipRate = 15
    }
    
    private func initView() {
        addCostTextField()
        addTipLabel()
        addTotalLabel()
        addTipPicker()
    }
    
    
    private func addCostTextField() {
        
        costTextField.placeholder = "$0.00"
        costTextField.font = SomeConstants.textViewFont
        costTextField.textAlignment = .right
        costTextField.keyboardType = .numberPad
        costTextField.addTarget(self, action: #selector(MainViewController.costTextFieldDidChange(textField:)), for: .editingChanged)
        
        view.addSubview(costTextField)
        
        costTextField.snp.makeConstraints {
            maker in
            maker.top.equalTo(view.snp.top).offset(topHeight)
            maker.left.equalTo(view.snp.centerX)
            maker.right.equalTo(view.snp.right)
            maker.height.equalTo((view.bounds.height-topHeight)/4)
        }
    }
    
    private func addTipLabel() {
        
        tipLabel.textAlignment = .right
        
        view.addSubview(tipLabel)
        tipLabel.font = SomeConstants.font
        tipLabel.textColor = SomeConstants.fontColor
        tipLabel.snp.makeConstraints {
            maker in
            
            maker.left.equalTo(costTextField.snp.left)
            maker.right.equalTo(view.snp.right).offset(-view.bounds.width/4)
            maker.top.equalTo(costTextField.snp.bottom)
            maker.height.equalTo((view.bounds.height-topHeight)/8)
        }
        
        
        tipValueLabel.textAlignment = .right
        
        view.addSubview(tipValueLabel)
        tipValueLabel.font = SomeConstants.font
        tipValueLabel.textColor = SomeConstants.fontColor
        
        tipValueLabel.snp.makeConstraints {
            maker in
            maker.left.equalTo(tipLabel.snp.right)
            maker.top.equalTo(tipLabel.snp.top)
            maker.size.equalTo(tipLabel.snp.size)
        }
    }
    
    private func addTotalLabel() {
        let totalTextLabel = UILabel()
        totalTextLabel.textAlignment = .right
        totalTextLabel.text = "Total:"
        totalTextLabel.font = SomeConstants.font
        totalTextLabel.textColor = SomeConstants.fontColor
        
        view.addSubview(totalTextLabel)
        
        totalTextLabel.snp.makeConstraints {
            maker in
            maker.left.equalTo(tipLabel.snp.left)
            maker.top.equalTo(tipLabel.snp.bottom)
            maker.size.equalTo(tipLabel.snp.size)
        }
        
        totalValueLabel.textAlignment = .right
        totalValueLabel.font = SomeConstants.font
        totalValueLabel.textColor = SomeConstants.fontColor
        view.addSubview(totalValueLabel)
        
        totalValueLabel.snp.makeConstraints {
            maker in
            maker.top.equalTo(tipLabel.snp.bottom)
            maker.left.equalTo(tipLabel.snp.right)
            maker.size.equalTo(tipLabel.snp.size)
        }
        
    }
    
    private func addTipPicker() {
        let slider = UISlider()
        slider.maximumValue = 100
        slider.minimumValue = 0
        slider.value = 15
        slider.addTarget(self, action: #selector(self.tipPickerChanged(picker:)), for: .valueChanged)
        
        view.addSubview(slider)
        
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

