//
//  UIView+OTExtension.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/9.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import Foundation

extension UIView {
    // x
    var ot_x: CGFloat {
        get {
            return frame.origin.x
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.origin.x = newValue
            frame = tempFrame
        }
    }
    
    /// y
    var ot_y: CGFloat {
        get {
            return frame.origin.y
        }
        set(newVal) {
            var tempFrame: CGRect = frame
            tempFrame.origin.y = newVal
            frame = tempFrame
        }
    }
    
    /// width
    var ot_wid: CGFloat {
        get {
            return frame.size.width
        }
        set(newVal) {
            var tempFrame: CGRect = frame
            tempFrame.size.width = newVal
            frame = tempFrame
        }
    }
    
    /// height
    var ot_hei: CGFloat {
        get {
            return frame.size.height
        }
        set(newVal) {
            var tempFrame: CGRect = frame
            tempFrame.size.height = newVal
            frame = tempFrame
        }
    }
    
    ///  left
    var ot_left: CGFloat {
        get {
            return ot_x
        }
        set(newVal) {
            ot_x = newVal
        }
    }
    
    /// right
    var ot_right: CGFloat {
        get {
            return ot_x + ot_wid
        }
        set(newVal) {
            ot_x = newVal - ot_wid
        }
    }
    
    ///  top
    var ot_top: CGFloat {
        get {
            return ot_y
        }
        set(newVal) {
            ot_y = newVal
        }
    }
    
    /// bottom
    var ot_bottom: CGFloat {
        get {
            return ot_y + ot_hei
        }
        set(newVal) {
            ot_y = newVal - ot_hei
        }
    }
    
    /// centerX
    var ot_centerX: CGFloat {
        get {
            return center.x
        }
        set(newVal) {
            center = CGPoint(x: newVal, y: center.y)
        }
    }
    
    ///  centerY
    var ot_centerY: CGFloat {
        get {
            return center.y
        }
        set(newVal) {
            center = CGPoint(x: center.x, y: newVal)
        }
    }
    
    /// middleX
    var ot_midX: CGFloat {
        get {
            return ot_wid/2.0
        }
    }
    
    ///  middleY
    var ot_midY: CGFloat {
        get {
            return ot_hei/2.0 + ot_y
        }
    }
    
    /// middlePoint
    var ot_midPoint: CGPoint {
        get {
            return CGPoint(x: ot_midX, y: ot_midY)
        }
    }
    
    
    //  MARK:   -   渐变色
    /// 水平渐变色, 左 ---> 右
    open func gradientLayerHorizontal(_ startColor: UIColor, _ endColor: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.layer.bounds
        
        //  分段设置渐变色
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.cornerRadius = self.layer.cornerRadius
        
        self.layer .insertSublayer(gradientLayer, at: 0)
    }
    
    
    
    
    //  MARK:   -   获取当前view的Controller
    func getCurrentController() -> UIViewController {
        var next = self.next
        while next != nil {
            if (next?.isKind(of: UIViewController.classForCoder()))! {
                return (next as? UIViewController)!
            }
            next = next?.next
        }
        return UIViewController()
    }
    
    //  MAKR:   - 根据字符串寻找子view
    func subViewOfClassName(_ className: String) -> UIView? {
        for subView: UIView in self.subviews {
            
            let viewType = String(describing: type(of: subView))
            if viewType == className {
                OTUtils.LogOut("呦呦呦")
                return subView
            }
            
            let resFound = subView.subViewOfClassName(className)
            if resFound != nil {
                OTUtils.LogOut("呦呦呦")
                return resFound
            }
        }
        return nil
    }
    
    
    
}







