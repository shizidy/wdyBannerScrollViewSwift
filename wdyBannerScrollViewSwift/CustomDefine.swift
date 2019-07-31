//
//  CustomDefine.swift
//  BannerScrollViewSwift
//
//  Created by Macmini on 2019/3/1.
//  Copyright © 2019 Macmini. All rights reserved.
//

import UIKit

let kScreenWidth = UIScreen.main.bounds.size.width
let kScreenHeight = UIScreen.main.bounds.size.height
let kStatusBarHeight = UIApplication.shared.statusBarFrame.size.height
let kNavigationBarHeight = kStatusBarHeight + 44
let kCellHeight = 50


//判断iPhone4系列
let IS_IPHONE4 = UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 640, height: 960).equalTo(((UIScreen.main.currentMode?.size)!)) : false
//判断iPhone5系列
let IS_IPHONE5 = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 640, height: 1136).equalTo((UIScreen.main.currentMode?.size)!) : false)
//判断iPhone6系列
let IS_IPHONE6 = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 750, height: 1334).equalTo((UIScreen.main.currentMode?.size)!) : false)
//判断iPhone6Plus系列
let IS_IPHONE6_PLUS = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1242, height: 2208).equalTo((UIScreen.main.currentMode?.size)!) : false)
//判断iPhone5系列
//let IS_IPHONE6_PLUS_SCALE =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1125, height: 2001).equalTo((UIScreen.main.currentMode?.size)!) : false)
//判断iPhoneX系列
let IS_IPHONE_X = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1125, height: 2436).equalTo((UIScreen.main.currentMode?.size)!) : false)
//判断iPhoneX系列
let IS_IPHONE_Xr = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 828, height: 1792).equalTo((UIScreen.main.currentMode?.size)!) : false)
//判断iPhoneX系列
let IS_IPHONE_Xs = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1125, height: 2436).equalTo((UIScreen.main.currentMode?.size)!) : false)
//判断iPhoneX系列
let IS_IPHONE_Xs_Max = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1242, height: 2688).equalTo((UIScreen.main.currentMode?.size)!) : false)
//判断是否是iPad
let IS_IPAD = (UIDevice.current.userInterfaceIdiom == .pad)





func kFitWidth(x: CGFloat) -> CGFloat {
    return x * kScreenWidth / (IS_IPAD ? 768.0 : 375.0)
}
func kFitHeight(y: CGFloat) -> CGFloat {
    return y * ((IS_IPHONE_X || IS_IPHONE_Xs) ? 667.0 : ((IS_IPHONE_Xr || IS_IPHONE_Xs_Max) ? 667.0*414.0 / 375.0 : kScreenHeight)) / (IS_IPAD ? 1024.0 : 667.0)
}

//func IS_IPAD() -> Bool {
//    return UIDevice.current.userInterfaceIdiom == .pad
//}
//
//let IS_iPad = IS_IPAD()







