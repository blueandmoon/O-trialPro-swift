//
//  UIImage+Extension.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/18.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import Foundation

extension UIImage {
    
    /// 根据颜色生成图片
    static func imageFromColor(_ color: UIColor, _ size: CGSize) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(size)   //  创建图片
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.setFillColor(color.cgColor)    //  填充颜色
        ctx?.fill(rect)
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return img
    }
    
    
}


