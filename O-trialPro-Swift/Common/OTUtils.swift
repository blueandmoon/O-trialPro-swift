//
//  OTUtils.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/9.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import Foundation

class OTUtils {
    
    
    
    //  MARK: - 打印
    static func LogOut(file:String = #file, function: String = #function, line:Int = #line, _ obj: Any) {
        let fileName = (file as NSString).lastPathComponent
        
        #if DEBUG
        print("\(fileName.components(separatedBy: ".")[0])-\(line)_\(function):   \(obj)")
        #endif
    }
    
    
    //  MARK:   - UserDefault
    static func OTSetObject(_ value: String, _ key: String) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    static func OTObject(_ key: String) -> String {
        let temp = UserDefaults.standard.value(forKey: key)
        return temp == nil ? "" : temp as! String
    }
    
    static func OTRemoveObjectForKey(_ key: String) {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    
    //  MARK:   -   加载动画
    static func startAnimationLoading() {
        
        
        
        
        
        
    }
    
    func endAnimationLoading() {
        let window = UIApplication.shared.keyWindow
        for v:UIView in (window?.subviews)! {
            if v.tag == 12345 {
                v.removeFromSuperview()
            }
        }
    }
    
    //  MARK:   - 加tap手势
    func addTap(_ handler: (()->())) {
        
        //        let tap = UITapGestureRecognizer(target: self, action: #selector(handler))
        
        OTUtils.LogOut("哈哈哈哈")
        if handler != nil {
            handler()
        }
    }
    
    
    
}


