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
    static let root = BaseTabbarController()
        
    private var navArr = [BaseNavigationController]()
    var curNav: BaseNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarStyle = .lightContent
        
        let arr = [["title": "首页",
                    "class": HomeVC(),
                    "img": "tab_home_normal",
                    "seletedImg": "tab_home_click"],
                   ["title": "消息",
                    "class": MessageVC(),
                    "img": "tab_information_normal",
                    "seletedImg": "tab_information_click"],
                   ["title": "受试者",
                    "class": SubjectVC(),
                    "img": "tab_subjects_normal",
                    "seletedImg": "tab_subjects_click"],
                   ["title": "统计",
                    "class": StatisticsVC(),
                    "img": "tab_statistics_normal",
                    "seletedImg": "tab_statistics_click"],
                   ["title": "我的",
                    "class": MineVC(),
                    "img": "tab_my_normal",
                    "seletedImg": "tab_my_click"]
                   ]

        for temp in arr {
            let vc = temp["class"]
            let nav = BaseNavigationController(rootViewController: vc as! UIViewController)
            nav.tabBarItem.title = temp["title"] as? String
            nav.tabBarItem.image = UIImage(named: temp["img"]! as! String)
            nav.tabBarItem.selectedImage = UIImage(named: temp["seletedImg"]! as! String)
            
            
            self.addChildViewController(nav)
            navArr.append(nav)
        }
        
        curNav = navArr.first
        self.delegate = self
        self.tabBar.tintColor = OT_Light_Yellow.toUIColor()
        

        
    }
    
    func reBuildControllers() {
//        root = BaseTabbarController()
        keyWindow?.rootViewController = BaseTabbarController.root
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        curNav = self.navArr[self.selectedIndex]
        if self.selectedIndex == 1 {    //  隐去消息角标
            let item = tabBarController.tabBar.items![1]
            item.badgeValue = nil
        }
    }
    
    func pushViewController(_ viewController: UIViewController!, _ animated: Bool) {
        viewController.hidesBottomBarWhenPushed = true
        curNav?.pushViewController(viewController, animated: animated)
    }
    
//    func pushViewController(_ viewController: UIViewController!, _ animated: Bool, _ complete: ((_ isFinished: Bool?) -> ())) {
//        curNav?.pushViewController(viewController, animated: animated)
//    }
    
    func popViewController(_ animated: Bool) -> UIViewController? {
        return curNav?.popViewController(animated: animated)
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
