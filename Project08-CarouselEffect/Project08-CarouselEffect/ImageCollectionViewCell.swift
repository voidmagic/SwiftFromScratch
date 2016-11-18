//
//  ImageCollectionViewCell.swift
//  Project08-CarouselEffect
//
//  Created by 王迁 on 2016/11/17.
//  Copyright © 2016年 王迁. All rights reserved.
//

import UIKit
import SnapKit

class ImageCollectionViewCell: UICollectionViewCell {
    private var imageView = UIImageView()
    private let titleLabel = UILabel()
    
    var interest: Interest! {
        didSet {
            imageView.image = interest.image
            titleLabel.text = interest.title
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        initView()
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
        
    }
    
    private func initView() {
        initImageView()
        initTitleLabel()
    }
    
    private func initImageView() {
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
        titleLabel.backgroundColor = UIColor.white.withAlphaComponent(0.9)
        titleLabel.snp.makeConstraints {
            maker in
            maker.centerX.equalTo(self.snp.centerX)
            maker.width.equalTo(imageView.snp.width)
            maker.bottom.equalTo(self.snp.bottom)
        }
    }
    
}
