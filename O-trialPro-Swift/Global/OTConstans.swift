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
public let base_Url = "http://122.144.199.68:9002"  //  dev
//    public let base_Url = "https://test.o-trial.com"  //  dis

//  MARK:   - OTCOLOR
public let OT_Main_Bg = "#F8F8F8"   //  背景色
public let OT_Light_Yellow = "#F3970E"    //  明黄色
public let OT_Blue_Black = "#092948"  //  蓝黑色?
public let OT_Blue_Light = "0594FF"    //  明蓝色
public let OT_Cycn_Light = "3BB204"    //  亮青色
public let OT_Title_Black = "333333"   //  标题黑
public let OT_Content_Gray = "#5C5C57"    //  内容灰黑?
public let OT_SubText_Gray = "#999999"    //  次级内容灰色?
public let OT_Light_Gray = "#CCCCCC"  //  浅灰色?
public let OT_Tiny_Gray = "#EEEEEE"   //  轻灰色


//  MARK:   - 时间格式
public let OTFormat_YearSecond = "yyyy-MM-dd HH:mm:ss"
public let OTFormat_YearDay = "yyyy-MM-dd"
public let OTFormat_HourSecond = "HH:mm:ss"


//  MARK:   - UserDefault持久化的值
public let OT_User_Email = "user_emial"  //  用户名
public let OT_User_Pwd = "user_pwd"  //  密码







