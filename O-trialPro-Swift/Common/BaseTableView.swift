//
//  BaseTableView.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/23.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit

class BaseTableView: UITableView {

    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        if #available(iOS 11.0, *) {
            self.contentInsetAdjustmentBehavior = .never
        } else {
            // Fallback on earlier versions
        }
        
//        self.separatorStyle = .none
        self.showsVerticalScrollIndicator = false
        
        self.tableFooterView = UIView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func reloadData() {
        if !Thread.isMainThread {
            DispatchQueue.main.async {
                super.reloadData()
            }
        } else {
            super.reloadData()
        }
        
    }
    
    
    
    
    
}
