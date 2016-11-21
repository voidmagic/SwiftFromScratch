//
//  MainViewController.swift
//  Project08-CarouselEffect
//
//  Created by VoidMagic on 2016/11/17.
//  Copyright © 2016年 VoidMagic. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.clear
        cv.dataSource = self
        cv.delegate = self
        cv.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    
    
    internal var interests = [Interest]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    override func loadView() {
        view = UIView(frame: UIScreen.main.bounds)
        initView()
    }
    
    
    private func initView() {
        addBackground()
        collectionView.contentInset = UIEdgeInsets(top: 15, left: 10, bottom: 0, right: 15)
        view.addSubview(collectionView)
        interests = Interest.createInterests()
    }
    
    private func addBackground() {
        let imageView = UIImageView(image: UIImage(named: "bg"))
        view.addSubview(imageView)
        
        imageView.snp.makeConstraints {
            maker in
            maker.center.equalTo(view.snp.center)
            maker.size.equalTo(view.snp.size)
        }
    }
    
    
    // MARK: collection view datasource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCollectionViewCell
        cell.interest = interests[indexPath.row]
        return cell
    }
    
    // MARK: collection view delegate flow layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = screenWidth.subtracting(30)
        let itemHeight = itemWidth
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
}

