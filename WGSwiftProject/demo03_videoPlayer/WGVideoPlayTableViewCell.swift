//
//  WGVideoPlayTableViewCell.swift
//  WGSwiftProject
//
//  Created by wanggang on 2019/3/21.
//  Copyright © 2019 wangg. All rights reserved.
//

import UIKit

class WGVideoPlayTableViewCell: UITableViewCell {

    let videoImageView = UIImageView()
    let videoPlayBtn = UIButton()
    let videoLab = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.white
        
        videoImageView.frame = CGRect(x: self.left, y: self.top, width: WgWith, height: 300)
        
        videoPlayBtn.bounds = CGRect(x: 0, y: 0, width: 40, height: 40)
        videoPlayBtn.center = videoImageView.center
        videoPlayBtn.setImage(UIImage.init(named: "playBtn"), for: .normal)
        
        videoLab.frame = CGRect(x: videoImageView.left, y: videoImageView.height-50, width: videoImageView.width, height: 30)
        videoLab.textColor = UIColor.white
        videoLab.textAlignment = .center
        
        contentView.addSubview(videoImageView)
        videoImageView.addSubview(videoPlayBtn)
        videoImageView.addSubview(videoLab)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadContent(model: WGVideoPlayModel) {
        
        videoImageView.image = UIImage.init(named: model.imageName)
        videoLab.text = model.descrip
    }
}
