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
//        let maskV = UIView(frame: (keyWindow?.bounds)!)
//        keyWindow?.addSubview(maskV)
//        maskV.backgroundColor = .clear
        
        let animation = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 80, height: 80), type: NVActivityIndicatorType.ballSpinFadeLoader, color: OT_Light_Yellow.toUIColor(), padding: 0)
        let maskV = animation.addMaskView(clickHandler: nil)
        animation.center = (maskV?.center)!
        maskV?.addSubview(animation)
        animation.startAnimating()
        objc_setAssociatedObject(self, &loadingAnimationKey, maskV, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    static func stopLoading() {
        let maskV = objc_getAssociatedObject(self, &loadingAnimationKey) as? UIView
        DispatchQueue.main.async {
            maskV?.removeFromSuperview()
        }
    }
    
    /**** 添加一个蒙板view, 在self地下 ***/
    func addMaskView(_ bgColor: UIColor?, _ alpha: CGFloat?, clickHandler: (() -> ())?) -> UIView? {
        
        let window = UIApplication.shared.keyWindow
        
        //  底层蒙版
        let maskV: UIView? = UIView(frame: (window?.bounds)!)
        window?.addSubview(maskV!)
        maskV?.backgroundColor = bgColor
        maskV?.alpha = alpha!
        maskV?.whenTapped {
            clickHandler!()
        }
        
        return maskV
    }
    
    func addMaskView(clickHandler: (() -> ())?) -> UIView? {
        return self.addMaskView(UIColor.clear, 1.0, clickHandler: clickHandler)
    }
    
    //  文字消息弹框
    static func alertText(_ text: String?) {
        if text?.count == 0 || text == nil {
            return
        }
        if !Thread.isMainThread {
            DispatchQueue.main.async {
                alertText(text)
            }
            return
        }
        
        let lbl: UILabel? = UILabel()
        lbl?.text = String(format: "%@", text!)
        lbl?.font = UIFont.systemFont(ofSize: 15)
        lbl?.backgroundColor = UIColor.black
        lbl?.textAlignment = .center
        lbl?.alpha = 0.8
        lbl?.textColor = .white
        let maskV = lbl?.addMaskView {
//            OTUtils.LogOut("点击蒙板")
        }
        maskV?.addSubview(lbl!)
        
        var wid = text?.getWidth(UIFont.systemFont(ofSize: 15), CGSize(width: 0, height: 50))
        var hei: CGFloat = 30.0
        if Double(wid!) > 250.0 {
            hei = (text?.getHeight(UIFont.systemFont(ofSize: 15), CGSize(width: 250, height: 0)))!
        }
        hei = CGFloat(Double(hei) > 100.0 ? 100 : Double(hei))
        wid = CGFloat(Double(wid!) > 250.0 ? 250.0 : Double(wid!))
        lbl?.frame = CGRect(x: 0, y: 0, width: wid! + 30, height: hei + 20)
        lbl?.center = (maskV?.center)!
        lbl?.layer.cornerRadius = 5
        lbl?.clipsToBounds = true
        lbl?.numberOfLines = 3
        
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
//            OTUtils.LogOut("三秒结束")
            lbl?.removeFromSuperview()
            maskV?.removeFromSuperview()
        }
        
    }
    

    
    
    
}
