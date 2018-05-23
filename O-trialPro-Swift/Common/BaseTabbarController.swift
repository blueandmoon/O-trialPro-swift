//
//  BaseTabbarController.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/23.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit

class BaseTabbarController: UITabBarController, UITabBarControllerDelegate {

    public static var shared = BaseTabbarController()
    private var navArr = [UIViewController]()
    var curNav: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let arr = [["title": "首页",
                    "class": "HomeVC",
                    "img": "tab_home_normal",
                    "seletedImg": "tab_home_click"],
                   ["title": "我的",
                    "class": "MineVC",
                    "img": "tab_my_normal",
                    "seletedImg": "tab_my_click"],
                   ]
        
        for temp in arr {
            let aclass = NSClassFromString(temp["class"]!) as! UIViewController.Type
            let vc = aclass.init()
            
            let nav = BaseNavigationController(rootViewController: vc)
            nav.tabBarItem.title = temp["title"]
            nav.tabBarItem.image = UIImage(named: temp["img"]!)
            nav.tabBarItem.selectedImage = UIImage(named: temp["selectedImg"]!)
            
            self.addChildViewController(nav)
            navArr.append(nav)
        }
        
        curNav = navArr.first
        self.delegate = self
        
//        self.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.t], for: <#T##UIControlState#>)
        
    }
    
    

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
