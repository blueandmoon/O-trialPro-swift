//
//  OTMineModel.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/24.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit

class OTMineModel: OTBaseModel {

    var title: String?
    var img: String?
    var items: [OTMineModel?]?
    
    init(_ title: String?, _ img: String?, _ items: [OTMineModel]?) {
        self.title = title
        self.img = img
        self.items = items
        super.init()
    }
    
    required init() {
        
    }
    
    
}
