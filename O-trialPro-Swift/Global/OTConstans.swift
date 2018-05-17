//
//  OTConstans.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/9.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import Foundation

//  MARK: - 常用全局变量

public let kScreenWidth = UIScreen.main.bounds.width
public let kScreenHeight = UIScreen.main.bounds.height
public let kStatusHeight = UIApplication.shared.statusBarFrame.size.height
//public let kNavHeight_StatusHeight: ((UIViewController) -> CGFloat) = {
//    (vc: UIViewController) -> CGFloat in
//    weak var weakVC = vc
//    var navHeight = weakVC?.navigationController?.navigationBar.bounds.size.height
//    return (navHeight! + kStatusHeight)
//}
public let kIOSVersion = Double(UIDevice.current.systemVersion)
public let kIPHONE_X = (kScreenWidth == 375 && kStatusHeight == 812 ? true : false)
public let kTabbarHeight = (kIPHONE_X ? 83 : 49)
public let kNavHeight = (kIPHONE_X ? 88 : 64)
public let keyWindow = UIApplication.shared.keyWindow

/// MARK    - 基本网址
struct OTNet {
    //  development
    static let base_Url = "http://122.144.199.68:9002"
//    //  distribution
//    static let base_Url = "https://test.o-trial.com"
}

//  MARK:   - OTCOLOR
struct OTColor {
    static let Main_Bg = "0xF8F8F8"   //  背景色
    static let Light_Yellow = "0xF3970E"    //  明黄色
    static let Blue_Black = "0x092948"  //  蓝黑色?
    static let Blue_Light = "0594FF"    //  明蓝色
    static let Cycn_Light = "3BB204"    //  亮青色
    static let Title_Black = "333333"   //  标题黑
    static let Content_Gray = "0x5C5C57"    //  内容灰黑?
    static let SubText_Gray = "0x999999"    //  次级内容灰色?
    static let Light_Gray = "0xCCCCCC"  //  浅灰色?
    static let Tiny_Gray = "0xEEEEEE"   //  轻灰色
}

//  MARK:   - 时间格式
struct OTTimeFormat {
    static let OTYear_Second = "yyyy-MM-dd HH:mm:ss"
    static let OTYear_Day = "yyyy-MM-dd"
    static let OTHour_Second = "HH:mm:ss"
}

//  MARK:   - UserDefault持久化的值
struct OTPersistence {
    static let user_email = "user_emial"  //  用户名
    static let user_pwd = "user_pwd"  //  密码
}






