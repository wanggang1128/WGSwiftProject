//
//  WGCustomFontViewController.swift
//  WGSwiftProject
//
//  Created by wanggang on 2019/3/20.
//  Copyright © 2019 wangg. All rights reserved.
//

import UIKit

class WGCustomFontViewController: UIViewController {

    let tableView = UITableView.init(frame: CGRect(x: 0, y: 64, width: WgWith, height: WgHeight-64-50), style: .plain)
    //隐式解析可选类型
    var changeLab: UILabel!
    
    let dataArr = ["hello world!", "隐式解析可选类型",
                   "一个隐式解析可选类型其实就是一个普通的可选类型",
                   "let tableView = UITableView.init", "但是可以被当做非可选类型来使用，并不需要每次都使用解析来获取可选值", "123", "UITableView", "@@@@@@####"]
    
    let fontNames = ["Zapfino",
                     "Gaspar Regular"]
    
    var fontIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.buildBaseView()
    }
    
    func buildBaseView(){
        self.title = "变换字体"
        self.view.backgroundColor = UIColor.white
        
        tableView.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        self.view .addSubview(tableView)
        
        changeLab = UILabel(frame: CGRect(x: 0, y: WgHeight-50, width: WgWith, height: 50))
        changeLab.textAlignment = .center
        changeLab.font = UIFont.systemFont(ofSize: 30)
        changeLab.text = "变换"
        //必须设置isUserInteractionEnabled为true才可以响应tap
        changeLab.isUserInteractionEnabled = true
        view.addSubview(changeLab)
        
        //这么做只是为了实验手势,可以用button
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapFunc))
        changeLab.addGestureRecognizer(tap)
    }
    
    @objc func tapFunc() {
        fontIndex = (fontIndex+1)%fontNames.count
        tableView.reloadData()
    }
}

extension WGCustomFontViewController:UITableViewDelegate, UITableViewDataSource{
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArr.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = dataArr[indexPath.row]
        cell.backgroundColor = UIColor.black
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont(name: self.fontNames[fontIndex], size: 15)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 40
    }
}
