//
//  BaseViewController.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/15.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.isTranslucent = false
        
        self.navigationController?.navigationBar.barTintColor = OT_Light_Yellow.toUIColor()
        self.navigationController?.navigationBar.shadowImage = UIImage()    //  导航栏下灰条
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17), NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        if (kIOSVersion!) < 11.0 {
            self.navigationController?.automaticallyAdjustsScrollViewInsets = false
            self.automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    public func addBackItem() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "all_nav_black"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(backClick(_:)))
    }
    
    @objc func backClick(_ backItem: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    public func addRightButton(_ title: String) {
//        var textW = title.getWidth(UIFont.systemFont(ofSize: 16), CGSize(width: 0, height: 20))
//        textW = min(textW, 80)
//
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(rightButtonClick(_:)))
    }
    
    @objc func rightButtonClick(_ rightItem: UIBarButtonItem) {
        LogOut("rightItemClick")
    }
    
    public func configUI() {
        LogOut("加载view")
    }
    
    public func getData() {
        LogOut("请求数据")
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
