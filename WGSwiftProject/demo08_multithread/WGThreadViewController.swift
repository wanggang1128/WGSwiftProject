//
//  WGThreadViewController.swift
//  WGSwiftProject
//
//  Created by wanggang on 2019/8/28.
//  Copyright © 2019 wangg. All rights reserved.
//

import UIKit

class WGThreadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        title = "多线程测试"
    
        method01()
        
    }
   
    //NSOperation
    func method01() {
        
        let blockOperation = BlockOperation {
            
            self.common01()
        }
        
        let queue = OperationQueue()
        queue.addOperation(blockOperation)
    }
    
    //GCD
    func method02() {
        
        let serial = DispatchQueue(label: "derial")
        let global = DispatchQueue.global(qos: .default)
    }
    
    func common01() {
        let imageUrl = "https://upload.jianshu.io/users/upload_avatars/5720820/a8379ec9-dbe8-4a45-bf97-52905d531156.jpg"
        var data = try? Data(contentsOf: URL(string: imageUrl)!)
        DispatchQueue.main.async {
            print("----->\(data?.count)")
        }
    }

}
