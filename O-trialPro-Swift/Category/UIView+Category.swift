//
//  UIView+Category.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/18.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import Foundation
import NVActivityIndicatorView
private var loadingAnimationKey = "loadingAnimationKey"


extension UIView {
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
            OTUtils.LogOut("\(viewType)")
            if viewType == className {
                return subView
            }
            
            let resFound = subView.subViewOfClassName(className)
            if resFound != nil {
                return resFound
            }
        }
        return nil
    }
    
    //  MARK:   - 加载动画
    static func startLoading() {
        UIView.stopLoading()    //  先移除可能存在的
        
        //  底层蒙版
        let maskV = UIView(frame: (keyWindow?.bounds)!)
        keyWindow?.addSubview(maskV)
        maskV.backgroundColor = .clear
        
        let animation = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 80, height: 80), type: NVActivityIndicatorType.ballSpinFadeLoader, color: OT_Light_Yellow.toUIColor(), padding: 0)
        animation.center = maskV.center
        maskV.addSubview(animation)
        animation.startAnimating()
        objc_setAssociatedObject(self, &loadingAnimationKey, maskV, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    static func stopLoading() {
        let maskV = objc_getAssociatedObject(self, &loadingAnimationKey) as? UIView
        DispatchQueue.main.async {
            maskV?.removeFromSuperview()
        }
    }
    

    
    
    
}
