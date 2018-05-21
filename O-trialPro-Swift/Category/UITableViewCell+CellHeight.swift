//
//  UITableViewCell+CellHeight.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/21.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import Foundation

private var cellHeightKey = "TableViewCellHeightKey"

extension UITableViewCell {
    
    var cellHeight: NSNumber? {
        set {
            objc_setAssociatedObject(self, &cellHeightKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return (objc_getAssociatedObject(self, &cellHeightKey) as! NSNumber)
        }
    }
    
    
    
    
    
    
    
    
    
    
}
