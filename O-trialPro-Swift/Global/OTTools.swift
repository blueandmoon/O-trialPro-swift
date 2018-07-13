//
//  OTTools.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/7/13.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import Foundation

//  MARK: - 打印
func LogOut(file:String = #file, function: String = #function, line:Int = #line, _ obj: Any) {
    let fileName = (file as NSString).lastPathComponent
    
    #if DEBUG
    print("\(fileName.components(separatedBy: ".")[0])-\(line)_\(function)___:   \(obj)")
    #endif
}

//  MARK:   - UserDefault
func OTSetObject(_ value: String, _ key: String) {
    UserDefaults.standard.set(value, forKey: key)
    UserDefaults.standard.synchronize()
}

func OTObject(_ key: String) -> String {
    let temp = UserDefaults.standard.value(forKey: key)
    return temp == nil ? "" : temp as! String
}

func OTRemoveObjectForKey(_ key: String) {
    UserDefaults.standard.removeObject(forKey: key)
    UserDefaults.standard.synchronize()
}

//  MARK:   - color

func HexColor(_ hexString: String) -> UIColor {
    
    return HexColor(hexString, 1.0)
}

func HexColor(_ hexString: String, _ alpa: CGFloat) -> UIColor {
    //  处理数值
    var cString = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    
    if cString.hasPrefix("0x") {
        cString = (cString as NSString).substring(from: 2)
    } else if cString.hasPrefix("#") {
        cString = (cString as NSString).substring(from: 1)
    } else if cString.count != 6 {
        return UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
    }
    
    
    //  字符串截取
    var range = NSRange()
    range.location = 0
    range.length = 2
    
    let rString = (cString as NSString).substring(with: range)
    
    range.location = 2
    let gString = (cString as NSString).substring(with: range)
    
    range.location = 4
    let bString = (cString as NSString).substring(with: range)
    
    //  存储转换后的值
    var r:UInt32 = 0, g:UInt32 = 0, b:UInt32 = 0
    //  进行转换
    Scanner(string: rString).scanHexInt32(&r)
    Scanner(string: gString).scanHexInt32(&g)
    Scanner(string: bString).scanHexInt32(&b)
    //  根据颜色值创建UIColor
    return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: alpa)
}

