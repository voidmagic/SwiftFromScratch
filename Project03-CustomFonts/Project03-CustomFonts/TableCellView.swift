//
//  TableCellView.swift
//  Project03-CustomFonts
//
//  Created by 王迁 on 2016/11/12.
//  Copyright © 2016年 王迁. All rights reserved.
//

import UIKit
import SnapKit

class TableCellView: UITableViewCell {

    var fontName: String? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    private struct FontSizeConstants {
        private init() {}
        static let smallLeftFontSize: CGFloat = 16
        static let smallRightFontSize: CGFloat = 10
    }
    
    
    
    override func draw(_ rect: CGRect) {
        initLeftLabel()
        initRightLabel()
    }
    
    private func initLeftLabel() {
        let label = UILabel()
        label.text = "Void Magic 2016"
        label.textAlignment = .left
        if let name = fontName {
            label.font = UIFont(name: name, size: FontSizeConstants.smallLeftFontSize)
        }
        addSubview(label)
        
        label.snp.makeConstraints {
            maker in
            
            maker.left.equalTo(self.snp.left)
            maker.right.equalTo(self.snp.centerX)
            maker.top.equalTo(self.snp.top)
            maker.bottom.equalTo(self.snp.bottom)
        }
    }
    
    private func initRightLabel() {
        let label = UILabel()
        if let name = fontName {
            label.text = name
            label.font = UIFont(name: name, size: FontSizeConstants.smallLeftFontSize)
        }
        label.textAlignment = .right
        addSubview(label)
        
        label.snp.makeConstraints {
            maker in
            
            maker.left.equalTo(self.snp.centerX)
            maker.right.equalTo(self.snp.right)
            maker.top.equalTo(self.snp.top)
            maker.bottom.equalTo(self.snp.bottom)
        }
    }
}
