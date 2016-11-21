//
//  ImageCollectionViewCell.swift
//  Project08-CarouselEffect
//
//  Created by VoidMagic on 2016/11/17.
//  Copyright © 2016年 VoidMagic. All rights reserved.
//

import UIKit
import SnapKit

class ImageCollectionViewCell: UICollectionViewCell {
    private let titleLabel = UILabel()
    private let imageView = UIImageView()
    
    var interest: Interest! {
        didSet {
            imageView.image = interest.image
            titleLabel.text = interest.title
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initImageView()
        initTitleLabel()
        
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func initImageView() {
        imageView.contentMode = .scaleAspectFill
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints {
            maker in
            maker.center.equalTo(self.snp.center)
            maker.size.equalTo(self.snp.size)
        }
    }
    
    private func initTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.backgroundColor = UIColor(red:0.71, green:0.93, blue:0.71, alpha:0.9)
        titleLabel.snp.makeConstraints {
            maker in
            maker.centerX.equalTo(self.snp.centerX)
            maker.width.equalTo(imageView.snp.width)
            maker.bottom.equalTo(self.snp.bottom)
            maker.height.equalTo(50)
        }
    }
    
}
