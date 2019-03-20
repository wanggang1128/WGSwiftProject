//
//  WGTimepieceViewController.swift
//  WGSwiftProject
//
//  Created by wanggang on 2019/3/20.
//  Copyright © 2019 bozhong. All rights reserved.
//

import UIKit

class WGTimepieceViewController: UIViewController {

    let startBtn = UIButton.init()
    let pauseBtn = UIButton.init()
    let resetBtn = UIButton.init()
    let timeLab = UILabel.init()
    
    // 浮点数默认是Double类型，若要使用Float，需要显示声明
    var timeValue:Float = 0.0 {
        // 属性观察器
        didSet{
            timeLab.text = String(format: "%.1f", timeValue)
        }
    }
    
    //需要设置成可选类型,因为不用时为nil
    var timer: Timer? = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildBaseView()
    }

    func buildBaseView() {
        
        self.title = "定时器"
        self.view.backgroundColor = UIColor.white
        
        timeLab.text = "0.0"
        timeLab.backgroundColor = UIColor.yellow
        timeLab.textAlignment = .center
        timeLab.font = UIFont.systemFont(ofSize: 40)
        timeLab.frame = CGRect.init(x: 0, y: 64, width: WgWith, height: (WgHeight-64)*0.3)
        
        startBtn.setImage(UIImage.init(named: "play"), for: .normal)
        startBtn.backgroundColor = UIColor.blue
        startBtn.isEnabled = true
        startBtn.addTarget(self, action: #selector(startBtnClicked), for: .touchUpInside)
        startBtn.frame = CGRect.init(x: 0, y: 64+(WgHeight-64)*0.3, width: WgWith*0.5, height: (WgHeight-64)*0.7)
        
        pauseBtn.setImage(UIImage.init(named: "pause"), for: .normal)
        pauseBtn.backgroundColor = UIColor.cyan
        pauseBtn.isEnabled = false
        pauseBtn.addTarget(self, action: #selector(pauseBtnClicked), for: .touchUpInside)
        pauseBtn.frame = CGRect.init(x: WgWith*0.5, y: 64+(WgHeight-64)*0.3, width: WgWith*0.5, height: (WgHeight-64)*0.7)
        
        resetBtn.setTitle("清零", for: .normal)
        resetBtn.setTitleColor(UIColor.black, for: .normal)
        resetBtn.setTitleColor(UIColor.gray, for: .disabled)
        resetBtn.isEnabled = false
        resetBtn.addTarget(self, action: #selector(resetBtnClicked), for: .touchUpInside)
        resetBtn.frame = CGRect.init(x: (WgWith-100), y: 80, width: 80, height: 30)
        
        view.addSubview(timeLab)
        view.addSubview(startBtn)
        view.addSubview(pauseBtn)
        view.addSubview(resetBtn)
        
    }
    
    //开始
    @objc func startBtnClicked(){
        
        startBtn.isEnabled = false
        pauseBtn.isEnabled = true
        resetBtn.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerRun), userInfo: nil, repeats: true)
    }
    
    //暂停
    @objc func pauseBtnClicked(){
        
        startBtn.isEnabled = true
        pauseBtn.isEnabled = false
        resetBtn.isEnabled = true

        if let timerTemp = timer {
            timerTemp.invalidate()
        }
        timer = nil
    }
    
    //重置
    @objc func resetBtnClicked(){
        
        timeValue = 0.0
        startBtn.isEnabled = true
        pauseBtn.isEnabled = false
        resetBtn.isEnabled = false

        if let timerTemp = timer {
            timerTemp.invalidate()
        }
        timer = nil
    }
    
    //计时
    @objc func timerRun(){
        
        timeValue += 0.1
    }
}
