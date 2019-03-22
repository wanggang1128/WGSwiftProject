//
//  WGCarouselViewController.swift
//  WGSwiftProject
//
//  Created by wanggang on 2019/3/21.
//  Copyright © 2019 wangg. All rights reserved.
//

import UIKit

class WGCarouselViewController: UIViewController {

    //隐式解析可选类型
    var collectionView: UICollectionView!
    let dataArr = WGCarouselModel.createData()
    let backgroundImgView = UIImageView(frame: WgRect)

    override func viewDidLoad() {
        super.viewDidLoad()

        buildBaseView()
    }
    
    func buildBaseView() {
        
        self.view.backgroundColor = UIColor.white
        self.title = "轮播图"
        
        backgroundImgView.image = UIImage(named: "blue")

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: (WgHeight-ItemHeight)*0.5, width: WgWith, height: ItemHeight), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clear
        collectionView.register(WGCarouselCollectionViewCell.self, forCellWithReuseIdentifier: "WGCarouselCollectionViewCell")
        collectionView.isPagingEnabled = true
        
        self.view.addSubview(backgroundImgView)
        self.view.addSubview(collectionView)
    }
}

extension WGCarouselViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WGCarouselCollectionViewCell", for: indexPath) as! WGCarouselCollectionViewCell
        cell.dataModel = dataArr[indexPath.row]
        return cell
    }
}

extension WGCarouselViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ItemWidth, height: ItemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}
