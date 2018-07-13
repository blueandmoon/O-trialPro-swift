//
//  HomeVC.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/23.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit

class HomeVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.title = "首页"
        self.title = "日历".engString()
        
        configUI()
        
        
    }
    
    //  MARK:   - view
    override func configUI() {
        
        let leftItem = UILabel()
        view.addSubview(leftItem)
        leftItem.text = "项目详情"
        leftItem.textColor = .white
        leftItem.font = UIFont.systemFont(ofSize: 16)
        leftItem.frame = CGRect(x: 0, y: 0, width: 70, height: 20)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftItem)
        leftItem.whenTapped {
            self.navigationController?.pushViewController(ProjectDetailVC(), animated: true)
        }
        
        let rightItem = UILabel()
        view.addSubview(rightItem)
        rightItem.text = "筛选范围"
        rightItem.textColor = .white
        rightItem.font = UIFont.systemFont(ofSize: 16)
        rightItem.frame = CGRect(x: 0, y: 0, width: 70, height: 20)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightItem)
        rightItem.whenTapped {
            OTSiteView.showSiteView(selectedDone: { (siteModel) in
                LogOut("\(siteModel.siteName)")
            })
        }
        
        
        
        
        
    }
    
    
    
    //  MARK:   - event
    
    //  MARK:   - data

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
