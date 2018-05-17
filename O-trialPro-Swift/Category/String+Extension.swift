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
    
//    //  MARK:   - Range 与 NSRange转换
//    //range转换为NSRange
//    
//    //扩展的是String类，不可改为NSRange或者Range的扩展，因为samePosition，utf16是String里的
//    func nsRange(from range: Range<String.Index>) -> NSRange {
//        
//        let from = range.lowerBound.samePosition(in: utf16)
//        
//        let to = range.upperBound.samePosition(in: utf16)
//        
//        return NSRange(location: utf16.distance(from: utf16.startIndex, to: from), length: utf16.distance(from: from, to: to))
////        return NSRange(location: utf16.distance(from: utf16.startIndex, to: from),
////
////                       length: utf16.distance(from: from, to: to))
//        
//    }
//    
//    //  NSRange转为Range
//    //扩展的是String类，不可改为NSRange或者Range的扩展，因为utf16是String里的
//    
//    func range(from nsRange: NSRange) -> Range<String.Index>? {
//        guard
//            let from16 = utf16.index(utf16.startIndex, offsetBy: nsRange.location, limitedBy: utf16.endIndex),
//            let to16 = utf16.index(from16, offsetBy: nsRange.length, limitedBy: utf16.endIndex),
//            let from = String.Index(from16, within: self),
//            
//            let to = String.Index(to16, within: self)
//            
//            else { return nil }
//        
//        return from ..< to
//        
//    }
    
    
}
