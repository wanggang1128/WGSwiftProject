//
//  WGRandomColorViewController.swift
//  WGSwiftProject
//
//  Created by wanggang on 2019/3/22.
//  Copyright © 2019 wangg. All rights reserved.
//

import UIKit
import AVFoundation

class WGRandomColorViewController: UIViewController {

    var audioPlayer = AVAudioPlayer()
    let gradientLayer = CAGradientLayer()
    
    var timer: Timer?
    
    var backColor: (red: CGFloat, blue: CGFloat, green: CGFloat, alpha: CGFloat)!{
        
        didSet{
            
            let color01 = UIColor(red: backColor.red, green: backColor.blue, blue: backColor.blue, alpha: backColor.alpha).cgColor
            let color02 = UIColor(red: backColor.blue, green: backColor.green, blue: backColor.red, alpha: backColor.alpha).cgColor
            gradientLayer.colors = [color01, color02]
        }
    }
    
    let playBtn = UIButton(frame: CGRect(x: (WgWith-60)*0.5, y: (WgHeight-60)*0.5, width: 60, height: 60))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "渐变色"
        self.view.backgroundColor = UIColor.cyan
        
        
        
        playBtn.setBackgroundImage(UIImage(named: "music play"), for: .normal)
        playBtn.addTarget(self, action: #selector(playBtnClicked), for: .touchUpInside)
        view.addSubview(playBtn)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        timer?.invalidate()
        timer = nil
    }
    
    @objc func playBtnClicked(){
        
        let music = URL(fileURLWithPath: Bundle.main.path(forResource: "Ecstasy", ofType: "mp3")!)
        
        do{
            try AVAudioSession.sharedInstance().setActive(true)
            try audioPlayer = AVAudioPlayer(contentsOf: music)
            
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        }catch let audioError as NSError {
            print(audioError)
        }
        
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        }
        
        let red = CGFloat(drand48())
        let blue = CGFloat(drand48())
        let green = CGFloat(drand48())
        
        self.view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        
        gradientLayer.frame = view.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        self.view.layer.addSublayer(gradientLayer)
    }
    
    @objc func timerFunc() {
        
        let redValue = CGFloat(drand48())
        let blueValue =  CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        
        backColor = (redValue, blueValue, greenValue, 1)
    }
}
