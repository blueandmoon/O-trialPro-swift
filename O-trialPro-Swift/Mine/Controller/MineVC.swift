//
//  MineVC.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/23.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit

class MineVC: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    var list: [OTMineModel]?
    var listView: BaseTableView?
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        handleData()
        
    }
    
    //  MARK:   - view
    func configUI() {
        
        listView = BaseTableView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: CGFloat(kScreenHeight) - CGFloat(kNavHeight)), style: .plain)
        view.addSubview(listView!)
        listView?.delegate = self
        listView?.dataSource = self
        
        
    }

    
    //  MARK:   - UITableViewDelegate & dataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (list?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = OTMineCell.initMineCell(tableView)
        
        return cell
    }
    
    
    
    //  MARK:   - event
    
    
    //  MARK:   - data
    
    func handleData() {
        
        let arr = NSMutableArray(contentsOfFile: Bundle.main.path(forResource: "mine.plist", ofType: nil)!)
        OTUtils.LogOut(arr ?? "...")
        
//        for dic in arr! {
//            OTUtils.LogOut(dic)
//            let temp = dic as! [String: Any?]
//            OTUtils.LogOut(temp["title"])
//        }
        list = Array()
//        let m = OTMineModel()
//        list?.append(m)
        
        
        for dic in arr! {
            let dic = dic as! [String: Any?]
            let model = OTMineModel()
            model.title = dic["title"] as? String
            model.img = dic["img"] as? String
            if let tempArr = dic["items"] {
                model.items = Array()
                let tempArr = tempArr as! Array<Any>
                for tempDic in tempArr {
                    let tempModel = OTMineModel()
                    let tempDic = tempDic as! [String: Any?]
                    tempModel.title = tempDic["title"] as? String
                    tempModel.img = tempDic["img"] as? String
                    model.items?.append(tempModel)
                }
                
            }
            list?.append(model)
        }
        listView?.reloadData()
        
        
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
