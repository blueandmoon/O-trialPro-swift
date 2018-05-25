//
//  UITextField+Extension.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/8.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit


 /// 很败兴, 没封装好~~~
 var leftIcon : UIImage?

class UITextField_Extension: UITextField {
    
//    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
//        var iconRect = super.leftViewRect(forBounds: bounds)
//        iconRect.origin.x += 50.0
//        return iconRect
//    }
    
    override func drawPlaceholder(in rect: CGRect) {
        
    }
    
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        var r = super.editingRect(forBounds: bounds);
        r.origin.x += 150.0
//        return r
        return CGRect(x: 200, y: 0, width: bounds.size.width, height: bounds.size.height)
    }
    
    
//    override var text: String? {
//        set {
//        }
//        get {
//            if Thread.isMainThread {
//                return super.text
//            } else {
//                DispatchQueue.main.async {
//                    return super.text
//                }
//            }
//            return super.text
//        }
//    }

}

extension UITextField {
    
    convenience init(frame:CGRect, leftImg:UIImage) {

//        self.init(frame: frame, leftImg: leftImg)
        self.init(frame: frame)
        
        
        let leftIV = UIImageView(image: leftImg)
        leftIV.frame = CGRect.init(x: 20, y: 0, width: 55, height: self.frame.size.height*0.8)
        leftIV.layer.borderWidth = 1.0;
        leftIV.contentMode = UIViewContentMode.right
        self.leftViewMode = UITextFieldViewMode.always
        self.leftView = leftIV
        
        
    }
    
    
    
    
}
