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
    let dataArr = ["demo01_ timepiece:定时器"]
    
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
    }
    
}

