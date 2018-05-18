//
//  MyProjectVC.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/18.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit

class MyProjectVC: BaseViewController {

    //  MARK:   - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addBackItem()
        
        self.configUI()
        
        
    }
    
    //  MARK:   - view
    func configUI() {
        
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: kScreenWidth - 80, height: 30))
//        self.navigationController?.navigationBar.addSubview(searchBar)
//        self.view.addSubview(searchBar)
//        searchBar.frame = CGRect(x: 40, y: kNavHeight - 5 - 30, width: kScreenWidth, height: 30)
        self.navigationItem.titleView = searchBar
//        searchBar.center = (self.navigationController?.navigationBar.center)!
        searchBar.layer.cornerRadius = searchBar.ot_hei/2.0
        searchBar.clipsToBounds = true
        searchBar.backgroundColor = .purple
        self.navigationController?.navigationBar.isTranslucent = false
        
        if let bgV = searchBar.subViewOfClassName("_UISearchBarSearchFieldBackgroundView") {
            bgV.layer.cornerRadius = 15
            bgV.clipsToBounds = true
        }
//        let bgV: UIView = searchBar.subViewOfClassName("_UISearchBarSearchFieldBackgroundView")!
        
        
        
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
