//
//  ViewController.swift
//  WGSwiftProject
//
//  Created by wanggang on 2019/3/20.
//  Copyright © 2019 bozhong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let tableView = UITableView.init(frame: UIScreen.main.bounds, style: .plain)
    let dataArr = ["demo01_ timepiece:定时器", "demo02_customFont:变换字体", "demo03_videoPlayer:视频播放器", "demo04_carousel:轮播图", "demo05_location:定位", "demo06_randomColor:渐变色", "demo06_btnAlphaControls:按钮图文混排"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.buildBaseView()
    }
    
    
    
    func buildBaseView(){
        self.title = "根视图"
        self.view.backgroundColor = UIColor.white
        
        tableView.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        self.view .addSubview(tableView)

    }
}

//MARK:- UIViewTableView DataSource & Delegate
// 知识点：扩展
// 扩展和 Objective-C 中的分类类似，但没有名称
// 扩展可以为一个类型添加新的功能，但是不能重写已有的功能。
// 扩展可以添加新的计算型属性，但是不可以添加存储型属性，也不可以为已有属性添加属性观察器。
extension ViewController:UITableViewDelegate, UITableViewDataSource{
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArr.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = dataArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            let vc = WGTimepieceViewController.init()
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = WGCustomFontViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = WGVideoPlayViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = WGCarouselViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 4:
            let vc = WGLocationViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 5:
            let vc = WGRandomColorViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 6:
            let vc = WGBtnAlphaControlsViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            
        default:
            break
        }
    }
}

