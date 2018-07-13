//
//  ProjectDetailVC.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/7/9.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit

class ProjectDetailVC: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    var siteArr: [[String: Any?]] = []
    var history: [[String: Any?]] = []
    var textArr: [[String: Any?]] = []
    var tb: BaseTableView?
    var logoIV: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "项目详情"
        addBackItem()
        
        configUI()
        getDetail()
        
        
        
    }
    
    //  MARK:   - view
    override func configUI() {
        tb = BaseTableView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - kNavHeight - kTabbarHeight), style: .plain)
        view.addSubview(tb!)
        tb?.backgroundColor = .white
        tb?.delegate = self
        tb?.dataSource = self
        tb?.separatorStyle = .none

        let header = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 100))
        tb?.tableHeaderView = header
        
        logoIV = UIImageView(frame: CGRect(x: 15, y: 0, width: 100, height: 100))
        header.addSubview(logoIV!)
        logoIV?.clipsToBounds = true
        logoIV?.contentMode = .scaleAspectFit
        logoIV?.backgroundColor = .white
        
    }
    
    //  MARK:   - view
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = OTProjectDetailCell.initCellWithTable(tableView)
            let detail = self.textArr[indexPath.row]["detail"]
            cell.lbl?.text = String(format: "%@: %@", self.textArr[indexPath.row]["title"] as! String, (detail as? String)!)
            cell.lbl?.textColor = HexColor(OT_Content_Gray)
            
            return cell
            
        }
        else if indexPath.section == 1 {
            let cell = OTSiteListCell.initCell(tableView)
            let dic:[String: Any?] = self.siteArr[indexPath.row]
            cell.titleLbl?.text = dic["siteName"] as? String
                cell.contentLbl?.text = dic["protocolName"] as? String
            
            
            return cell
        }
        else {
            let cell = OTProjectDetailCell.initCellWithTable(tableView)
            cell.lbl?.text = self.history[indexPath.row]["protocolName"] as? String
            cell.lbl?.textColor = HexColor(OT_SubText_Gray)
            
            return cell
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let arr = [self.textArr, self.siteArr, self.history]
        return arr[section].count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = self.tableView(tableView, cellForRowAt: indexPath)
        return CGFloat((cell.cellHeight?.floatValue)!)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 40))
        header.backgroundColor = .white
        let lbl = UILabel(frame: CGRect(x: 15, y: 10, width: 200, height: 20))
        header.addSubview(lbl)
        lbl.textColor = HexColor(OT_Title_Black)
        lbl.font = UIFont.systemFont(ofSize: 17)
        let titles = ["详情", "中心列表", "方案历史"]
        lbl.text = titles[section].engString()
        
        let line = UIView(frame: CGRect(x: 15, y: header.height - 1, width: header.width, height: 1))
        header.addSubview(line)
        line.backgroundColor = HexColor(OT_Tiny_Gray)
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    //  MARK:   - event
    
    //  MARK:   - data
    
    func getDetail() {
        /*"data": {
         "projectInfo": {
         "vid": "1",
         "projectName": "项目编号1-新项目11",
         "orgId": "15498",
         "createUser": "13947",
         "createUserName": "测试OA",
         "createTime": "2017-08-18 16:45:35",
         "isDel": 1,
         "projectNo": "",
         "innerNo": "",
         "projectState": 0,
         "startDate": null,
         "siteAmount": 30,
         "applicant": "",
         "researchType": "",
         "trialStage": "",
         "therapyArea": "",
         "patientAmount": 123,
         "drugInstrument": ""
         },*/
        weak var weakSelf = self
        HttpHelper.Shared.Get(path: String(format: "/project/%@/detail", (OTCenter.shared.projectModel?.vid)!), params: nil, success: { (jsonString, mes) in
            if mes != nil {
                UIView.alertText("mes")
                return
            }
            let data = jsonString?.data(using: .utf8, allowLossyConversion: true)
            var res = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: Any?]
            if let dic = res!["data"] {
//                LogOut(dic ?? "")
                let dic = dic as! [String: Any?]
                if let sites = dic["sites"] {
                    self.siteArr = sites as! [[String : Any?]]
//                    LogOut(self.siteArr)
                }
                if let histories = dic["protocolHisList"] {
                    self.history = histories as! [[String : Any?]]
//                    LogOut(self.history)
                }
                
                self.textArr = Array()
                if let projectInfo = dic["projectInfo"] {
                    let projectInfo = projectInfo as! [String: Any?]
                    
                    self.textArr = [["title": "项目名称".engString(), "detail": ""],
                                    ["title": "项目编号".engString(), "detail": ""],
                                    ["title": "申办方".engString(), "detail": ""],
                                    ["title": "创建时间".engString(), "detail": ""],
                                    ["title": "开始时间".engString(), "detail": ""],
                                    ["title": "研究类型".engString(), "detail": ""],
                                    ["title": "实验阶段".engString(), "detail": ""],
                                    ["title": "治疗领域".engString(), "detail": ""],
                                    ["title": "受试者例数".engString(), "detail": ""]]
                    if projectInfo["projectName"] != nil {
                        self.textArr[0]["detail"] = String(format: "%@", projectInfo["projectName"] as! CVarArg)
                    }
                    if projectInfo["projectNo"] as? String != nil {
                        self.textArr[1]["detail"] = String(format: "%@", projectInfo["projectNo"] as! CVarArg)
                    }
                    if projectInfo["applicant"] as? String != nil {
                        self.textArr[2]["detail"] = String(format: "%@", projectInfo["applicant"] as! CVarArg)
                    }
                    if projectInfo["createTime"] as? String != nil {
                        self.textArr[3]["detail"] = String(format: "%@", projectInfo["createTime"] as! CVarArg)
                    }
                    if projectInfo["startDate"] as? String != nil {
                        self.textArr[4]["detail"] = String(format: "%@", projectInfo["startDate"] as! CVarArg)
                    }
                    if projectInfo["researchType"] as? String != nil {
                        self.textArr[5]["detail"] = String(format: "%@", projectInfo["researchType"] as! CVarArg)
                    }
                    if projectInfo["trialStage"] as? String != nil {
                        self.textArr[6]["detail"] = String(format: "%@", projectInfo["trialStage"] as! CVarArg)
                    }
                    if projectInfo["therapyArea"] as? String != nil {
                        self.textArr[7]["detail"] = String(format: "%@", projectInfo["therapyArea"] as! CVarArg)
                    }
                    if projectInfo["patientAmount"] as? NSNumber != nil {
                        self.textArr[8]["detail"] = String(format: "%@", projectInfo["patientAmount"] as! CVarArg)
                    }
//                    LogOut(self.textArr)
                    if projectInfo["projectLogo"] as? String != nil {
                        //  下载logo
                        weakSelf?.downLoadLogo((projectInfo["projectLogo"] as? String)!)
//                        LogOut(projectInfo["projectLogo"])
                    } else {
                        //  set tableView's header nil
                        weakSelf?.tb?.tableHeaderView = nil
                    }
                }
                
            }
            weakSelf?.tb?.reloadData()
            
            
        }) { (error) in
            LogOut(error.localizedDescription)
        }
        
        
        
        
    }
    
    func downLoadLogo(_ fillId: String) {
        weak var weakSelf = self
        HttpHelper.Shared.downLoad(String(format: "/docfiles/downloadnormal?fileId=%@", fillId), params: nil, success: { (data) in
            let img = UIImage(data: data)
            weakSelf?.logoIV?.image = img
            
        }) { (error) in
            LogOut(error.localizedDescription)
            DispatchQueue.main.async {
                weakSelf?.tb?.tableHeaderView = nil
            }
        }
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
