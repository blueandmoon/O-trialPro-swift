//
//  UIColor+HexColor.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/8.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit


class UIColor_HexColor: UIColor {
    
    
}

//extension UIColor {
//    
//    convenience init(hexString: String) {
//        self.init(hexString: hexString, alpha: 1.0)
////        UIColor(hexString: hexString, alpha: 1.0)
//    }
//    
//    convenience init(hexString:String, alpha: CGFloat) {
//        //  处理数值
//        var cString = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
//
//        if cString.hasPrefix("0x") {
//            cString = (cString as NSString).substring(from: 2)
//        } else if cString.hasPrefix("#") {
//            cString = (cString as NSString).substring(from: 1)
//        } else if cString.count != 6 {
//            self.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
//            return
//        }
//        
//        
//        //  字符串截取
//        var range = NSRange()
//        range.location = 0
//        range.length = 2
//        
//        let rString = (cString as NSString).substring(with: range)
//        
//        range.location = 2
//        let gString = (cString as NSString).substring(with: range)
//        
//        range.location = 4
//        let bString = (cString as NSString).substring(with: range)
//        
//        //  存储转换后的值
//        var r:UInt32 = 0, g:UInt32 = 0, b:UInt32 = 0
//        //  进行转换
//        Scanner(string: rString).scanHexInt32(&r)
//        Scanner(string: gString).scanHexInt32(&g)
//        Scanner(string: bString).scanHexInt32(&b)
//        //  根据颜色值穿件UIColor
//        self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: alpha)
//    }
//    
//    
//    
//    
//    
//}

extension String{
    
    
    /// 将十六进制颜色转伟UIColor
    /// - Returns: UIColor
    public func toUIColor() -> UIColor {
        //处理数值
        var cString = self.uppercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        let length = (cString as NSString).length
        //错误处理
        if (length < 6 || length > 8 || (!cString.hasPrefix("#") && length == 7) || (!cString.hasPrefix("0X") && length == 8)){
            return UIColor.white
        }
        
        if cString.hasPrefix("#"){
            cString = (cString as NSString).substring(from: 1)
        }
        
        if cString.hasPrefix("0x") {
            cString = (cString as NSString).substring(from: 2)
        }
        
        
        
        //字符chuan截取
        var range = NSRange()
        range.location = 0
        range.length = 2
        
        let rString = (cString as NSString).substring(with: range)
        
        range.location = 2
        let gString = (cString as NSString).substring(with: range)
        
        range.location = 4
        let bString = (cString as NSString).substring(with: range)
        
        //存储转换后的数值
        var r:UInt32 = 0,g:UInt32 = 0,b:UInt32 = 0
        //进行转换
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        //根据颜色值创建UIColor
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
    }
    
    
    
    
    
    
}


