//
//  TableHeaderView.swift
//  Project03-CustomFonts
//
//  Created by VoidMagic on 2016/11/12.
//  Copyright © 2016年 VoidMagic. All rights reserved.
//

import UIKit
import SnapKit

class TableHeaderView: UIView {
    
    lazy var leftButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(ButtonNameConstants.leftButtonTitle, for: .normal)
        return button
    }()
    
    lazy var rightButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(ButtonNameConstants.rightButtonTitle, for: .normal)
        return button
    }()
    
    private struct ButtonNameConstants {
        private init() {}
        static let leftButtonTitle = "System Fonts"
        static let rightButtonTitle = "Custom Fonts"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red:0.96, green:1.00, blue:0.98, alpha:1.0)
        addSubview(leftButton)
        addSubview(rightButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        leftButton.snp.makeConstraints {
            maker in
            maker.left.equalTo(self.snp.left)
            maker.bottom.equalTo(self.snp.bottom)
            maker.top.equalTo(self.snp.top).offset(UIApplication.shared.statusBarFrame.height)
            maker.right.equalTo(self.snp.centerX)
        }
        rightButton.snp.makeConstraints {
            maker in
            maker.left.equalTo(self.snp.centerX)
            maker.right.equalTo(self.snp.right)
            maker.top.equalTo(self.snp.top).offset(UIApplication.shared.statusBarFrame.height)
            maker.bottom.equalTo(self.snp.bottom)
        }
    }
}
