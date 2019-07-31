//
//  ViewModel.swift
//  BannerScrollViewSwift
//
//  Created by Macmini on 2019/3/1.
//  Copyright © 2019 Macmini. All rights reserved.
//

import UIKit

class ViewModel: NSObject {
    
    //MARK: ========== init初始化 ==========
    override init() {
        super.init()
        for i in 0..<8 {
            self.imagesArr.add("icon_" + String.init(format: "%d.jpeg", i + 1))
        }
    }
    
    //MARK: ========== 懒加载 ==========
    lazy var imagesArr: NSMutableArray = {
        let imagesArr = NSMutableArray.init()
        return imagesArr
    }()
    
    
}

