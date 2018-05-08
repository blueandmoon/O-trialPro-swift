//
//  UITextField+Extension.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/8.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit




class UITextField_Extension: UITextField {

//    public var leftIcon : UIImage {
//        set {
//
//        }
//        get {
//            return self.leftIcon
//        }
//    }
    
    convenience init(frame:CGRect, leftImg:UIImage) {
        self.init(frame: frame)
        
//        leftIcon = leftImg
        
        let leftIV = UIImageView(image: leftImg)
//        leftIV.frame = CGRect.init(x: 20, y: 0, width: 55, height: self.frame.size.height*0.8)
        leftIV.layer.borderWidth = 1.0;
        leftIV.contentMode = UIViewContentMode.right
        self.leftViewMode = UITextFieldViewMode.always
        self.leftView = leftIV

        
//        self.init(frame: frame)
    }
    
    
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        
//        CGRect iconRect = [super leftViewRectForBounds:bounds];
//
//        iconRect.origin.x += 20;//
//
//        return iconRect;
        var iconRect = super.leftViewRect(forBounds: bounds)
        iconRect.origin.x += 20.0
        return iconRect
        
        
//        return CGRect.zero
    }
    
    

}
