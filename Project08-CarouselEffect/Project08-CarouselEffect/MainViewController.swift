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
        
        let collectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.contentInset = UIEdgeInsets(top: 15, left: 10, bottom: 0, right: 15)
        return collectionView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bg"))
        imageView.frame = self.view.frame
        return imageView
    }()
    
    
    
    internal var interests = [Interest]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    override func loadView() {
        view = UIView(frame: UIScreen.main.bounds)
    
        view.addSubview(imageView)
        
        view.addSubview(collectionView)
        
        interests = Interest.createInterests()
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

