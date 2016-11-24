//
//  ClearTableViewCell.swift
//  Project07-ClearTableViewCell
//
//  Created by VoidMagic on 2016/11/16.
//  Copyright © 2016年 VoidMagic. All rights reserved.
//

import UIKit

class ClearTableViewCell: UITableViewCell {
    
    let gradientLayer = CAGradientLayer()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        gradientLayer.frame = self.bounds
        let color1 = UIColor(white: 1.0, alpha: 0.2).cgColor
        let color2 = UIColor(white: 1.0, alpha: 0.1).cgColor
        let color3 = UIColor.clear.cgColor
        let color4 = UIColor(white: 0.0, alpha: 0.05).cgColor
        
        gradientLayer.colors = [color1, color2, color3, color4]
        gradientLayer.locations = [0.0, 0.04, 0.95, 1.0]
        layer.insertSublayer(gradientLayer, at: 0)
        
        self.textLabel?.textColor = UIColor.white
        self.textLabel?.backgroundColor = UIColor.clear
        self.textLabel?.font = UIFont(name: "Avenir Next", size: 18)
        self.selectionStyle = UITableViewCellSelectionStyle.none
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
