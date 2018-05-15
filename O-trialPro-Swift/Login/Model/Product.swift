//
//  Product.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/15.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit

class Product: NSObject {

    var data = ""
    var errorCode = ""
    var errorMessage = ""
    var success = ""
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "data" {
            OTUtils.LogOut("这是data")
        }
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        OTUtils.LogOut("未定义key值")
    }
    
    
}
