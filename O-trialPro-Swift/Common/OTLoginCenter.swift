//
//  OTLoginCenter.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/11.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit

class OTLoginCenter: NSObject {
}

public class OTCenter {
    public static var shared = OTCenter()

    var projectModel: OTProjectModel?
    var token: String?
    var vid: String?
    var userPass: String?
    var realName: String?
    var email: String?
    var mobile: String?
    var orgId: String?
    var company: String?
    var department: String?
    var position: String?
    var isDel: Bool?
    var userNameWX: String?
    var projectCount: Int?
    var projectNo: String?
    var userType: Int? {
        get {
            if vid == "PM" || vid == "CRA" {
                return 1
            } else if vid == "CRC" {
                return 2
            } else {
                return 0
            }
        }
    }
    
    
}









