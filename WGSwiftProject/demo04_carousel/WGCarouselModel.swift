//
//  WGCarouselModel.swift
//  WGSwiftProject
//
//  Created by wanggang on 2019/3/21.
//  Copyright © 2019 wangg. All rights reserved.
//

import UIKit

class WGCarouselModel: NSObject {

    var title: String?
    var detailTitle: String?
    var imgName: String?
    
    init(image: String, title: String, detail: String) {
        self.title = title
        self.detailTitle = detail
        self.imgName = image
    }
    
    //获取数据
    static func createData() -> [WGCarouselModel]{
        return [
            WGCarouselModel(image: "hello", title: "Hello there, i miss u.", detail: "We love backpack and adventures! We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨"),
            WGCarouselModel(image: "dudu", title: "🐳🐳🐳🐳🐳", detail: "We love romantic stories. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨"),
            WGCarouselModel(image: "bodyline", title: "Training like this, #bodyline", detail: "We love backpack and adventures! We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨"),
            WGCarouselModel(image: "wave", title: "I'm hungry, indeed.", detail: "We love backpack and adventures! We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨"),
            WGCarouselModel(image: "darkvarder", title: "Dark Varder, #emoji", detail: "We love backpack and adventures! We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨"),
            WGCarouselModel(image: "hhhhh", title: "I have no idea, bitch", detail: "We love backpack and adventures! We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨")
            
        ]
    }
}
