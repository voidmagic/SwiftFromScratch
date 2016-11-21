//
//  ViewController.swift
//  Project09-ImageScroller
//
//  Created by VoidMagic on 2016/11/21.
//  Copyright © 2016年 VoidMagic. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        if let iamge = UIImage(named: "image") {
            imageView.image = iamge
            imageView.sizeToFit()
        }
        return imageView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: self.view.bounds)
        scroll.backgroundColor = UIColor.clear
        scroll.contentSize = self.imageView.frame.size
        scroll.addSubview(self.imageView)
        scroll.delegate = self
        scroll.maximumZoomScale = 2.0
        scroll.minimumZoomScale = 0.1
        return scroll
    }()
    
    
    
    override func loadView() {
        view = UIView(frame: UIScreen.main.bounds)
    
        addBlurEffect()
        
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
    }
    
    private func recenterImage() {
        let scrollViewSize = scrollView.bounds.size
        let imageViewSize = imageView.frame.size
        let horizontalSpace = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2.0 : 0
        let verticalSpace = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height) / 2.0 : 0
        scrollView.contentInset = UIEdgeInsets(top: verticalSpace, left: horizontalSpace, bottom: verticalSpace, right: horizontalSpace)
    }
    
    private func addBlurEffect() {
        let imagev = UIImageView(image: UIImage(named: "image"))
        imagev.frame = view.frame
        view.addSubview(imagev)
        
        let blur = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        blur.frame = view.frame
        view.addSubview(blur)
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        recenterImage()
    }
}

