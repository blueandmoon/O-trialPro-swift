//
//  OTLoginModel.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/16.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import Foundation
import ObjectMapper

class OTBaseModel: Mappable {
//    var data: Any?
    var errorCode: Int?
    var errorMessage: String?
    var success: Bool?
    
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
//        data <- map["data"]
//        errorCode <- map["errorCode"]
//        errorMessage <- map["errorMessage"]
//        success <- map["success"]
    }
}

class OTLoginModel: OTBaseModel {
    var data: String?
    
    override init() {
        super.init()
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        data <- map["data"]
        errorCode <- map["errorCode"]
        errorMessage <- map["errorMessage"]
        success <- map["success"]
        
    }
}



//struct OTLoginModel: Mappable {
//    var data: String?
//    var errorCode: Int?
//    var errorMessage: String?
//    var success: Bool?
//
//    init?(map: Map) {
//    }
//
//    mutating func mapping(map: Map) {
//        data <- map["data"]
//        errorCode <- map["errorCode"]
//        errorMessage <- map["errorMessage"]
//        success <- map["success"]
//    }
//}



