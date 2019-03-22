//
//  WGCarouselCollectionViewCell.swift
//  WGSwiftProject
//
//  Created by wanggang on 2019/3/21.
//  Copyright © 2019 wangg. All rights reserved.
//

import UIKit

let ItemWidth = WgWith-40
let ItemHeight = WgHeight/3.0

class WGCarouselCollectionViewCell: UICollectionViewCell {
    
    var imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: ItemWidth, height: ItemHeight))
    var titleLab = UILabel(frame: CGRect(x: 0, y: ItemHeight-50, width: ItemWidth, height: 20))
    var detailLab = UILabel(frame: CGRect(x: 0, y: ItemHeight-30, width: ItemWidth, height: 30))
    
    //可选类型
    var dataModel: WGCarouselModel?{
        //属性观察
        didSet{
            loadContent()
        }
    }
    
    func loadContent() {
        
        imgView.image = UIImage(named: (dataModel?.imgName)!)
        titleLab.text = dataModel?.title
        detailLab.text = dataModel?.detailTitle
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLab.textColor = UIColor.white
        titleLab.font = UIFont.systemFont(ofSize: 16)
        titleLab.backgroundColor = UIColor.lightGray
        titleLab.textAlignment = .center
        
        detailLab.textColor = UIColor.white
        detailLab.font = UIFont.systemFont(ofSize: 13)
        detailLab.backgroundColor = UIColor.lightGray
        detailLab.textAlignment = .center
        detailLab.numberOfLines = 0
        detailLab.lineBreakMode = .byCharWrapping
        
        self.contentView.addSubview(imgView)
        self.contentView.addSubview(titleLab)
        self.contentView.addSubview(detailLab)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
