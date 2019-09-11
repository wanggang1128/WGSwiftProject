//
//  WGBtnAlphaControlsViewController.swift
//  WGSwiftProject
//
//  Created by wanggang on 2019/4/19.
//  Copyright © 2019 wangg. All rights reserved.
//

import UIKit

class WGBtnAlphaControlsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        //上下排列
        let btnTop = UIButton(frame: CGRect(x: 0, y: 100, width: 170, height: 70))
        btnTop.titleLabel?.font = UIFont.systemFont(ofSize: 20)//文字大小
        btnTop.setTitleColor(UIColor.black, for: .normal)
        btnTop.backgroundColor = UIColor.cyan
        btnTop.set(image: UIImage(named: "btnAlphaControl"), title: "标题在上方", titlePosition: .top, space: 10, state: .normal)
        view.addSubview(btnTop)
        
        let btnBottom = UIButton(frame: CGRect(x: btnTop.right+10, y: btnTop.top, width: 170, height: 70))
        btnBottom.titleLabel?.font = UIFont.systemFont(ofSize: 20)//文字大小
        btnBottom.setTitleColor(UIColor.black, for: .normal)
        btnBottom.backgroundColor = UIColor.cyan
        btnBottom.setTitle("标题在下方", for: .normal)
        btnBottom.setImage(UIImage(named: "btnAlphaControl"), for: .normal)
        btnBottom.lableToImage(titlePosition: .bottom, space: 30)
        view.addSubview(btnBottom)
        
        //左右排列
        let btnLeft = UIButton(frame: CGRect(x: 0, y: btnTop.bottom+100, width: 170, height: 30))
        btnLeft.titleLabel?.font = UIFont.systemFont(ofSize: 20)//文字大小
        btnLeft.setTitleColor(UIColor.black, for: .normal)
        btnLeft.backgroundColor = UIColor.cyan
        btnLeft.set(image: UIImage(named: "btnAlphaControl"), title: "标题在左边", titlePosition: .left, space: 10, state: .normal)
        view.addSubview(btnLeft)
        
        let btnRight = UIButton(frame: CGRect(x: btnLeft.right+10, y: btnLeft.top, width: 170, height: 30))
        btnRight.titleLabel?.font = UIFont.systemFont(ofSize: 20)//文字大小
        btnRight.setTitleColor(UIColor.black, for: .normal)
        btnRight.backgroundColor = UIColor.cyan
        btnRight.set(image: UIImage(named: "btnAlphaControl"), title: "标题在右边", titlePosition: .right, space: 10, state: .normal)
        view.addSubview(btnRight)
        
        
        
        
        
        
        let p = Person()
        //监听不到 存储属性
        print("------")
        print("默认值:\(p.avarageScore)")
        
        p.avarageScore = 11
        
        print("最终平均值结果 \(p.avarageScore)")
        
    }

}


class Person {
    
    //1.存储属性
    var mathScore :Double = 0.0
    var chineseScore : Double = 0.0
    
    //最终成绩, 存储属性
    private var score: Double = 0.0
    
    init(x : Double){
        avarageScore = x
    }
    
    init() {
    }
    
    //存储属性
    var avarageScore : Double = 0 {
        willSet {
            //newValue
            print("avarageScore即将发生改变 newValue = \(newValue), value = \(avarageScore)")
        }
        didSet {
            //oldValue
            print("avarageScore已经发生改变 oldValue = \(oldValue), value = \(avarageScore)")
        }
    }
    
}

