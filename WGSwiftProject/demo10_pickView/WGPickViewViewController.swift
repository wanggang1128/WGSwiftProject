//
//  WGPickViewViewController.swift
//  WGSwiftProject
//
//  Created by wanggang on 2019/9/18.
//  Copyright © 2019 wangg. All rights reserved.
//

import UIKit

class WGPickViewViewController: UIViewController {

    let pickView = UIPickerView()
    let startBtn = UIButton()
    let resLab = UILabel()
    
    var imgArr = [String]()
    var dataArr1 = [Int]()
    var dataArr2 = [Int]()
    var dataArr3 = [Int]()
    
    var bounds = CGRect.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black
        
        createView()
        initData()
        
    }
    
    func createView() {
        
        pickView.frame = CGRect(x: 0, y: 100, width: WgWith, height: WgHeight/3)
        pickView.backgroundColor = UIColor.white
        view.addSubview(pickView)
        
        startBtn.frame = CGRect(x: 15, y: pickView.bottom+10, width: WgWith-30, height: 40)
        startBtn.backgroundColor = UIColor.yellow
        startBtn.layer.cornerRadius = 5
        startBtn.layer.masksToBounds = true
        startBtn.setTitle("开始", for: .normal)
        startBtn.setTitleColor(UIColor.red, for: .normal)
        startBtn.addTarget(self, action: #selector(startBtnClicked), for: .touchUpInside)
        view.addSubview(startBtn)
        
        resLab.frame = CGRect(x: startBtn.left, y: startBtn.bottom+10, width: startBtn.width, height: startBtn.height)
        resLab.textColor = UIColor.white
        view.addSubview(resLab)
    
    }
    
    func initData() {
        
        imgArr = ["👻","👸","💩","😘","🍔","🤖","🍟","🐼","🚖","🐷"]
        for _ in 0...99 {
            dataArr1.append(Int(arc4random()%10))
            dataArr2.append(Int(arc4random()%10))
            dataArr3.append(Int(arc4random()%10))
        }
        resLab.text = ""
        pickView.delegate = self
        pickView.dataSource = self
        
        bounds = startBtn.bounds
    }
    
    @objc func startBtnClicked() {
        
        let index1:Int = Int(arc4random())%90+3
        let index2:Int = Int(arc4random())%90+3
        let index3:Int = Int(arc4random())%90+3
        
        pickView.selectRow(index1, inComponent: 0, animated: true)
        pickView.selectRow(index2, inComponent: 1, animated: true)
        pickView.selectRow(index3, inComponent: 2, animated: true)
        
        if dataArr1[pickView.selectedRow(inComponent: 0)] == dataArr2[pickView.selectedRow(inComponent: 1)] &&  dataArr1[pickView.selectedRow(inComponent: 0)] == dataArr3[pickView.selectedRow(inComponent: 2)]{
            
            resLab.text = "匹配成功"
        }else {
            resLab.text = "匹配失败"
        }
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 5, options: .curveLinear, animations: {
            
            self.startBtn.bounds = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: self.bounds.size.width - 20, height: self.bounds.size.height)
            
        }) { (complete) in
            
            UIView.animate(withDuration: 0.1, delay: 0.0, options: UIView.AnimationOptions(), animations: {
                
                self.startBtn.bounds = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: self.bounds.size.width, height: self.bounds.size.height)
                
            }, completion: nil)
        }
    }
    
}

extension WGPickViewViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return dataArr1.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        
        switch component {
        case 0:
            pickerLabel.text = imgArr[dataArr1[row]]
        case 1:
            pickerLabel.text = imgArr[dataArr1[row]]
        case 2:
            pickerLabel.text = imgArr[dataArr1[row]]
        default: break
            
        }
        
        pickerLabel.font = UIFont(name: "Apple Color Emoji", size: 80)
        pickerLabel.textAlignment = .center
        
        return pickerLabel
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        
        return 100
    }
}
