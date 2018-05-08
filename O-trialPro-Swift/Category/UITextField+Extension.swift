//
//  UITextField+Extension.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/8.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit




class UITextField_Extension: UITextField {

    public var leftIcon : UIImage {
        set {
            
        }
        get {
            return self.leftIcon
        }
    }
    
    convenience init(frame:CGRect, leftImg:UIImage) {
        self.init(frame: frame)
        
        leftIcon = leftImg
        
        
//        return nil
    }
    
    
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        
        
        return CGRect.zero
    }
    
    

}
