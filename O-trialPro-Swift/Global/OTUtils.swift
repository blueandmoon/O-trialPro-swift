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
        print("\(fileName.components(separatedBy: ".")[0])-\(line)_\(function):\(obj)")
        #endif
    }
    
    
    //  MARK:   - UserDefault
    static func OTSetObject(_ value: String, _ key: String) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    static func OTObject(_ key: String) {
        UserDefaults.standard.value(forKey: key)
    }
    
    static func OTRemoveObjectForKey(_ key: String) {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    
    
    
    
}


