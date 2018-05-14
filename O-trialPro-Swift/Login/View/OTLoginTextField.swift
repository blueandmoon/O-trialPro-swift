//
//  OTLoginTextField.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/14.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit

class OTLoginTextField: UITextField {

    var leftImgV: UIImageView!
    var leftImg: UIImage! {
        didSet {
            leftImgV.image = leftImg
            
            let w = 10 + leftImgV.frame.origin.x
            self.setValue(NSNumber(value: Float(w)), forKey: "paddingLeft")
        }
        
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.placeholder = ""
        self.font = UIFont.systemFont(ofSize: 17);
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.init(hexString: "dddddd").cgColor
        leftImgV = UIImageView(frame: CGRect(x: 0, y: 0, width: 25 + 20, height: 25))
        leftImgV.contentMode = UIViewContentMode.right
        self.leftViewMode = UITextFieldViewMode.always
        self.leftView = leftImgV
        self.sd_cornerRadiusFromHeightRatio = 0.5
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: 25 + 20, y: bounds.origin.y, width: bounds.size.width, height: bounds.size.height)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: 25 + 20 + 15, y: bounds.origin.y, width: bounds.size.width, height: bounds.size.height)
    }
    
    override func drawPlaceholder(in rect: CGRect) {
         super.drawPlaceholder(in: CGRect(x:  15, y: bounds.origin.y, width: bounds.size.width, height: bounds.size.height))
    }
    
    
    
    

}
