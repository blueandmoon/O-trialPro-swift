//
//  BaseResponse.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/22.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit
import HandyJSON

/// 基本返回数据类型
class BaseResponse<T: HandyJSON>: HandyJSON {

    var data: T? = nil
    var errorCode: Int? = nil
    var errorMessage: String? = nil
    var success: Bool? = false
    
    required init() {
        
    }
    
}

struct ProjectMMM: HandyJSON {
    var projectName: String?
    var vid: String?
    
}


