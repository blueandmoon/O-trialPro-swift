//
//  BaseNavigationController.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/23.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationBar.isHidden = true
        self.navigationController?.automaticallyAdjustsScrollViewInsets = false
        self.automaticallyAdjustsScrollViewInsets = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if !Thread.isMainThread {
            DispatchQueue.main.async {
//                super.pushViewController(viewController, animated: animated)
                self.pushViewController(viewController, animated: true)
                return
            }
        } else {
            super.pushViewController(viewController, animated: animated)            
        }
    }
    
    override func popViewController(animated: Bool) -> UIViewController? {
        if !Thread.isMainThread {
            DispatchQueue.main.async {
                return super.popViewController(animated: animated)
            }
        } else {
            return super.popViewController(animated: animated)
        }
        return nil
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
