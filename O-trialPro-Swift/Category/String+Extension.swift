//
//  String+Extension.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/14.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit

extension String {
    public func getWidth(_ font: UIFont, _ constrainSize: CGSize) -> CGFloat {
        return (self as NSString).getTextSize(font, constrainSize).width
    }
    
    public func getHeight(_ font: UIFont, _ constrainSize: CGSize) -> CGFloat {
        return (self as NSString).getTextSize(font, constrainSize).height
    }
    
//    init(str: String) {
//        let key = OTUtils.OTObject(OT_Language_key)
//        if key == "1" {
//            OTUtils.LogOut("...")
//
//        }
//        let dicPath = Bundle.main.path(forResource: "En_LanguageList", ofType: "plist")
//        let dic = NSDictionary(contentsOfFile: dicPath!) as! Dictionary<String, Any>
//
////        self.init()
//    }
    
    /// 国际化
    ///
    /// - Returns: 返回对应的字符串
    public func inter_String() -> String? {
        let key = OTUtils.OTObject(OT_Language_key)
        let dicPath = Bundle.main.path(forResource: "En_LanguageList", ofType: "plist")
        let dic = NSDictionary(contentsOfFile: dicPath!) as! Dictionary<String, Any>
        return key == "1" ? dic[self] as! String : self
    }
    
    
}
