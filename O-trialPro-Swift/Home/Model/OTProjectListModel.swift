//
//  OTProjectListModel.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/21.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit
import ObjectMapper

class OTProjectListModel: OTBaseModel {
    var data: [ProjectModel]?
    
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

class ProjectModel: Mappable {
    var vid: String?
    var projectName: String?
    var orgId: String?
    var createUser: String?
    var createUserName: String?
    var createTime: String?
    var isDel: Bool?
    var projectNo: String?
    var innerNo: String?
    var projectState: String?
    var startDate: String?
    var siteAmount: String?
    var applicant: String?
    var researchType: String?
    var trialStage: String?
    var therapyArea: String?
    var patientAmount: Any?
    var drugInstrument: String?
    
    init() {
    }
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        vid <- map["vid"]
        projectName <- map["projectName"]
        orgId <- map["orgId"]
        createUser <- map["createUser"]
        createUserName <- map["createUserName"]
        createTime <- map["createTime"]
        isDel <- map["isDel"]
        projectNo <- map["projectNo"]
        innerNo <- map["innerNo"]
        projectState <- map["projectState"]
        startDate <- map["startDate"]
        siteAmount <- map["siteAmount"]
        applicant <- map["applicant"]
        researchType <- map["researchType"]
        trialStage <- map["trialStage"]
        therapyArea <- map["therapyArea"]
        drugInstrument <- map["drugInstrument"]
    }
    
    
    
}
