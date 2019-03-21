//
//  WGVideoPlayViewController.swift
//  WGSwiftProject
//
//  Created by wanggang on 2019/3/21.
//  Copyright © 2019 wangg. All rights reserved.
//

import UIKit
import AVKit

class WGVideoPlayViewController: UIViewController {

    let tableView = UITableView(frame: CGRect(x: 0, y: 64, width: WgWith, height: WgHeight-64), style: .plain)
    
    var avplayVC = AVPlayerViewController()
    var avplayView = AVPlayer()
    
    var dataArr = [
    
        WGVideoPlayModel.init(imageName: "videoScreenshot01", descrip: "Introduce 3DS Mario"),
        WGVideoPlayModel.init(imageName: "videoScreenshot02", descrip: "Emoji Among Us"),
        WGVideoPlayModel.init(imageName: "videoScreenshot03", descrip: "Seals Documentary"),
        WGVideoPlayModel.init(imageName: "videoScreenshot04", descrip: "Lijiang Lugu Lake"),
        WGVideoPlayModel.init(imageName: "videoScreenshot05", descrip: "Facebook HQ"),
        WGVideoPlayModel.init(imageName: "videoScreenshot06", descrip: "Adventure Time")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.buildBaseView()
    }

    func buildBaseView(){
        self.title = "视频列表"
        self.view.backgroundColor = UIColor.white
        
        tableView.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(WGVideoPlayTableViewCell.self, forCellReuseIdentifier: "WGVideoPlayTableViewCell")
        self.view .addSubview(tableView)
    
    }
}


extension WGVideoPlayViewController: UITableViewDelegate, UITableViewDataSource{
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArr.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WGVideoPlayTableViewCell", for: indexPath) as! WGVideoPlayTableViewCell
        let model = dataArr[indexPath.row];
        
        cell.loadContent(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let path = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
        avplayView = AVPlayer(url: URL(fileURLWithPath: path!))
        avplayVC.player = avplayView
        
        self.present(avplayVC, animated: true, completion: {
            self.avplayVC.player?.play()
        })
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }

}
