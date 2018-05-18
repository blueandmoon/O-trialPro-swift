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
public let kIOSVersion = Double(UIDevice.current.systemVersion)
public let kIPHONE_X = (kScreenWidth == 375 && kStatusHeight == 812 ? true : false)
public let kTabbarHeight = (kIPHONE_X ? 83 : 49)
public let kNavHeight = (kIPHONE_X ? 88.0 : 64.0)
public let keyWindow = UIApplication.shared.keyWindow

public let infoDictionary =  Bundle.main.infoDictionary
public let shortVersion = infoDictionary!["CFBundleShortVersionString"]

/// MARK    - 基本网址
struct OTNet {
    //  development
    static let base_Url = "http://122.144.199.68:9002"
//    //  distribution
//    static let base_Url = "https://test.o-trial.com"
}

//  MARK:   - OTCOLOR
struct OTColor {
    static let Main_Bg = "#F8F8F8"   //  背景色
    static let Light_Yellow = "#F3970E"    //  明黄色
    static let Blue_Black = "#092948"  //  蓝黑色?
    static let Blue_Light = "0594FF"    //  明蓝色
    static let Cycn_Light = "3BB204"    //  亮青色
    static let Title_Black = "333333"   //  标题黑
    static let Content_Gray = "#5C5C57"    //  内容灰黑?
    static let SubText_Gray = "#999999"    //  次级内容灰色?
    static let Light_Gray = "#CCCCCC"  //  浅灰色?
    static let Tiny_Gray = "#EEEEEE"   //  轻灰色
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






