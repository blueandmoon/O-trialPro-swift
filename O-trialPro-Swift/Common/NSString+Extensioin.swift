//
//  NSString+Extensioin.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/14.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import Foundation

extension NSString {
    
    
    //  MARK:   - 文本宽高
    public func getTextSize(_ font: UIFont, _ constrainSize: CGSize) -> CGSize {
        var resSize = CGSize.zero
        if self.length <= 0 {
            return resSize
        }
        let style = NSMutableParagraphStyle()
        style.lineBreakMode = .byWordWrapping
        
        //  用相对小的width计算height || 小height计算width
        resSize = self.boundingRect(with: CGSize(width: floor(constrainSize.width), height: floor(constrainSize.height)), options: NSStringDrawingOptions(rawValue:  NSStringDrawingOptions.usesFontLeading.rawValue |    NSStringDrawingOptions.usesLineFragmentOrigin.rawValue), attributes: [.font: font], context: nil).size
        //  上面用的小width/height计算, 这里要 + 1
        resSize = CGSize(width: floor(resSize.width + 1), height: floor(resSize.height + 1))
        return resSize
    }
    
    public func getWidth(_ font: UIFont, _ constrainSize: CGSize) -> CGFloat {
        return self.getTextSize(font, constrainSize).width
    }
    
    public func getHeight(_ font: UIFont, _ constrainSize: CGSize) -> CGFloat {
        return self.getTextSize(font, constrainSize).height
    }
    
    
    
    
    
    
    
    
    
    
}
