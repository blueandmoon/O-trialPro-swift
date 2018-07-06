//
//  BaseCollectionView.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/7/5.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit

class BaseCollectionView: UICollectionView {

    
    override func reloadData() {
        if !Thread.isMainThread {
            DispatchQueue.main.async {
                super.reloadData()
            }
        } else {
            super.reloadData()
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
