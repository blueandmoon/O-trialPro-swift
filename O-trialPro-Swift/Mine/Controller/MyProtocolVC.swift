//
//  MyProtocolVC.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/6/19.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit

class MyProtocolVC: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    var arr: Array<String>?
    var lv: UITableView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "我的协议".engString()
        
        configUI()
        getData()
    }
    
    //  MARK:   - view
    override func configUI() {
        lv = UITableView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: CGFloat(kScreenHeight) - CGFloat(kNavHeight)), style: .grouped)
        view.addSubview(lv!)
        lv?.delegate = self
        lv?.dataSource = self
        lv?.backgroundColor = HexColor(OT_Main_Bg)
        lv?.separatorStyle = .none
        lv?.tableFooterView = UIView()
    }
    //  MARK:   - tableViewDelegate & dataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MyProtocolCell.initTableCell(tableView)
        cell.lbl?.text = arr?[indexPath.row].engString()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01;
    }
    
    
    
    
    //  MARK:   - event
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let str = indexPath.section == 0 ? "http://appc.o-trial.com:8888/usage-agreement.html" : "http://appc.o-trial.com:8888/user-agreement.html"
        self.navigationController?.pushViewController(OTWKWebController(URL(string: str)!), animated: true)
    }
    
    
    //  MARK:   -   data
    override func getData() {
        arr = ["用户注册及APP使用协议", "最终用户使用协议(方案)"];
        lv?.reloadData()
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
