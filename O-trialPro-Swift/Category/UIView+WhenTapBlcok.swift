//
//  UIView+WhenTapBlcok.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/10.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import Foundation

typealias LGWhenTappedBlock = () -> ()

//private var testKey: Void?
//private var kWhenTappedBlockKey: Void?

private var kWhenTappedBlockKey = "whenTapClickKey"

extension UIView {
    
    @objc func whenTapped(block: @escaping () -> ()) {
        let tap = self.addTapGestureRecognizerWithTaps(1, 1, #selector(viewWasTapped))
//        self.addRequiredToDoubleTapsRecognizer(tap)
        self.setBlock(block,  kWhenTappedBlockKey)
    }
    
    //  MARK:   -   callbacks
    
    @objc func viewWasTapped() {
        self.runBlockForKey(kWhenTappedBlockKey)
    }
    
    
    
    @objc private func addTapGestureRecognizerWithTaps(_ taps: Int, _ touches: Int, _ selector: Selector) -> UITapGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self, action: selector)
//        tap.delegate = self
        tap.numberOfTapsRequired = taps
        tap.numberOfTouchesRequired = touches
        self.addGestureRecognizer(tap)
        return tap
    }
    
    @objc func runBlockForKey(_ blockKey: String) {
        let block = objc_getAssociatedObject(self, &kWhenTappedBlockKey) as? LGWhenTappedBlock
        
        if block != nil {
            block!()
        }
    }
    func setBlock(_ block: @escaping LGWhenTappedBlock, _ blockKey: String) {
        self.isUserInteractionEnabled = true
        objc_setAssociatedObject(self, &kWhenTappedBlockKey, block, .OBJC_ASSOCIATION_COPY_NONATOMIC)
//        objc_setAssociatedObject(self, blockKey, block, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        
    }
    
//    @objc func addRequiredToDoubleTapsRecognizer(_ recognizer: UITapGestureRecognizer) {
//
//        for gesture:UIGestureRecognizer in self.gestureRecognizers! {
//            if gesture.isKind(of: UITapGestureRecognizer.classForCoder()) {
//                let tapGesture = UITapGestureRecognizer()
//                if tapGesture.numberOfTouchesRequired == 2 && tapGesture.numberOfTapsRequired == 1
//                {
//                    recognizer.require(toFail: tapGesture)
//                }
//            }
//        }
//    }
    
//    func setAssociated<T>(value: T, associatedKey: UnsafeRawPointer, policy: objc_AssociationPolicy = objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC) -> Void {
//        objc_setAssociatedObject(self, associatedKey, value, policy)
//    }
//
//    func getAssociated<T>(associatedKey: UnsafeRawPointer) -> T? {
//        let value = objc_getAssociatedObject(self, associatedKey) as? T
//        return value;
//    }
    
    
    
}

