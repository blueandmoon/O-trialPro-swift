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
    var header: OTMineHeaderView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true

        configUI()
        handleData()
        
    }
    
    //  MARK:   - view
    func configUI() {
        
        listView = BaseTableView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: CGFloat(kScreenHeight) - CGFloat(kTabbarHeight)), style: .plain)
        view.addSubview(listView!)
        listView?.delegate = self
        listView?.dataSource = self
        listView?.separatorStyle = UITableViewCellSeparatorStyle.singleLineEtched
        
        //  头部
        header = OTMineHeaderView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 228))
        listView?.tableHeaderView = header
        
        
        
        
        
    }

    
    //  MARK:   - UITableViewDelegate & dataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (list?.count) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = OTMineCell.initMineCell(tableView)
        cell.topLine?.isHidden = indexPath.row == 0 ? false : true
        cell.bottomLine?.isHidden = indexPath.row == (list?.count)! - 1 ? true: false
        cell.model = list?[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableView(tableView, cellForRowAt: indexPath).cellHeight?.floatValue as! CGFloat
    }
    
    
    //  MARK:   - event
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        if y < 0 {
            let totalOffset = (header?.ot_hei)! - y
            let scale = totalOffset / (header?.ot_hei)!
            header?.waterView?.frame = CGRect(x: -(kScreenWidth*scale - kScreenWidth)/2, y: y, width: kScreenWidth * scale, height: totalOffset)
            header?.waterView?.transform = CGAffineTransform.init(scaleX: scale, y: scale)
        }
    }
    
    
    //  MARK:   - data
    
    func handleData() {
        
        let arr = NSMutableArray(contentsOfFile: Bundle.main.path(forResource: "mine.plist", ofType: nil)!)
        
        list = Array()
        
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
