//
//  MainViewController.swift
//  Project08-CarouselEffect
//
//  Created by 王迁 on 2016/11/17.
//  Copyright © 2016年 王迁. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource {

    private var collectionView: UICollectionView! {
        didSet {
            collectionView.backgroundColor = UIColor.white.withAlphaComponent(0.0)
            collectionView.dataSource = self
            collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        }
    }
    
    internal var interests = [Interest]() {
        didSet {
            collectionView?.reloadData()
            collectionView?.scrollToItem(at: IndexPath(row: 0, section: 0) , at: .centeredHorizontally, animated: false)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        
    }
    
    private func initView() {
        addBackground()
        initCollectionView()
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
    
    private func initCollectionView() {
        
        let screenHeight = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
        
        let itemHeight = screenHeight.divided(by: 2)
        let itemWidth = screenWidth.subtracting(30)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)

        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            maker in
            maker.center.equalTo(view.snp.center)
            maker.width.equalTo(view.snp.width)
            maker.height.equalTo(view.bounds.height.divided(by: 4).multiplied(by: 3))
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCollectionViewCell
        cell.interest = interests[indexPath.row]
        return cell
    }
    
}

