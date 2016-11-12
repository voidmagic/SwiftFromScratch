//
//  TableHeaderView.swift
//  Project03-CustomFonts
//
//  Created by 王迁 on 2016/11/12.
//  Copyright © 2016年 王迁. All rights reserved.
//

import UIKit
import SnapKit

class TableHeaderView: UITableViewHeaderFooterView {
    
    let leftButton = UIButton(type: .system)
    let rightButton = UIButton(type: .system)

    private struct ButtonNameConstants {
        private init() {}
        static let leftButtonTitle = "System Fonts"
        static let rightButtonTitle = "Custom Fonts"
    }

    override func draw(_ rect: CGRect) {
        
        addLeftButton()
        addRightButton()
        
    }
    
    private func addLeftButton() {
        leftButton.setTitle(ButtonNameConstants.leftButtonTitle, for: .normal)
        addSubview(leftButton)
        
        leftButton.snp.makeConstraints {
            maker in
            maker.left.equalTo(self.snp.left)
            maker.bottom.equalTo(self.snp.bottom)
            maker.top.equalTo(self.snp.top).offset(UIApplication.shared.statusBarFrame.height)
            maker.right.equalTo(self.snp.centerX)
        }
    }
    
    private func addRightButton() {
        rightButton.setTitle(ButtonNameConstants.rightButtonTitle, for: .normal)
        addSubview(rightButton)
        
        rightButton.snp.makeConstraints {
            maker in
            maker.left.equalTo(self.snp.centerX)
            maker.right.equalTo(self.snp.right)
            maker.top.equalTo(self.snp.top).offset(UIApplication.shared.statusBarFrame.height)
            maker.bottom.equalTo(self.snp.bottom)
        }
    }
    

}
