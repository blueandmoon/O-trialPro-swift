//
//  MyProjectVC.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/18.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit
import HandyJSON

class MyProjectVC: BaseViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {

//    let searchBar = UITextField(frame: CGRect(x: 0, y: 0, width: kScreenWidth - 80, height: 30))
    
    
    var listArr = [OTProjectModel]()
    var originArr = [OTProjectModel]()
    var listView: BaseTableView?
    var logOut: (() -> ())?
    var searchBar: UISearchBar?
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        searchBar?.removeFromSuperview()
    }
    
    //  MARK:   - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addBackItem()
        
        self.configUI()
        
        self.getProjectList()
        
       
        
    }
    
    override func backClick(_ backItem: UIBarButtonItem) {
        super.backClick(backItem)
        if self.logOut != nil {
            self.logOut!()
        }
    }
    
    
    //  MARK:   - view
    func configUI() {
        
        //  对此searchBar绝望了, 得空了自己写, 麻蛋的
        searchBar = UISearchBar(frame: CGRect(x: 40, y: CGFloat((kNavHeight - 30 - 20)/2), width: kScreenWidth - 80, height: 30))
        self.navigationController?.navigationBar.addSubview(searchBar!)
        searchBar!.layer.cornerRadius = 15
        searchBar!.clipsToBounds = true
        searchBar!.delegate = self
        searchBar!.tintColor = OT_Content_Gray.toUIColor()    //  不设置, 光标不出现, 奇哉
        
        let searchField = searchBar!.value(forKey: "searchField") as? UITextField
        searchField?.backgroundColor = .white
        searchField?.sd_cornerRadiusFromHeightRatio = NSNumber(value: 0.5)
        searchField?.clipsToBounds = true
        searchField?.textColor = OT_Title_Black.toUIColor()
      
        for subview in searchBar!.subviews {
            subview.layer.cornerRadius = 15
            subview.clipsToBounds = true
            for sb in subview.subviews {
                sb.clipsToBounds = true
                sb.layer.cornerRadius = sb.ot_hei/2
                sb.sd_cornerRadiusFromHeightRatio = NSNumber(value: 0.5)
            }
        }
        
        listView = BaseTableView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: CGFloat(kScreenHeight) - CGFloat(kNavHeight)), style: .grouped)
        view.addSubview(listView!)
        listView?.backgroundColor = OT_Main_Bg.toUIColor()
        listView?.delegate = self
        listView?.dataSource = self
//        listView?.register(OTProjectListCell.classForCoder(), forCellReuseIdentifier: "OTProjectListCell")
        listView?.separatorStyle = .none
        
        let header = UILabel(frame: CGRect(x: 15, y: 0, width: 150, height: 40))
        header.backgroundColor = .white
        header.text = "     项目总数\(listArr.count)"
        header.textColor = OT_Content_Gray.toUIColor()
        header.font = UIFont.systemFont(ofSize: 16)
        listView?.tableHeaderView = header
        
        
    }
    
    //  MARK:   - UITableViewDelegate & dataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = OTProjectListCell.initCellWithTable(tableView)
        cell.model = listArr[indexPath.section]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return listArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat((self.tableView(tableView, cellForRowAt: indexPath).cellHeight?.floatValue)!)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if section == 0 {
//            let header = UILabel(frame: CGRect(x: 15, y: 0, width: 150, height: 40))
//            header.backgroundColor = .white
//            header.text = "     项目总数\(listArr.count)"
//            header.textColor = OT_Content_Gray.toUIColor()
//            header.font = UIFont.systemFont(ofSize: 16)
//            return header
//        }
        return UIView()
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return section == 0 ? 40: 10
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    
    
    //  MARK:   - UISearchBarDelegate
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        listArr = [OTProjectModel]() + originArr
        listArr = originArr.filter({ (model) -> Bool in
            return (model.projectName! as NSString).contains(searchBar.text!) || (model.projectNo! as NSString).contains(searchBar.text!)
        })
        
       
        listView?.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.endEditing(true)
        searchBar.showsCancelButton = false
        listArr = [OTProjectModel]() + originArr
        
        listView?.reloadData()
    }
    
    //  MARK:   - event
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        OTCenter.shared.vid = listArr[indexPath.section].vid
        OTCenter.shared.projectNo = listArr[indexPath.section].projectNo
        OTCenter.shared.projectModel = listArr[indexPath.section]
        getUseInfo()
    }
    
    //  MARK:   - data
    func getProjectList() {
        UIView.startLoading()
        HttpHelper.Shared.Get(path: "/userInfo/projects", params: nil, success: { (jsonString, mes) in
            if mes != nil {
                UIView.alertText(mes)
                return
            }
            
            self.originArr = JSONDeserializer<OTProjectModel>.deserializeModelArrayFrom(json: jsonString, designatedPath: "data")! as! [OTProjectModel]
            self.listArr = self.listArr + self.originArr
            self.listView?.reloadData()
//            DispatchQueue.main.async {
//            }
        }) { (error) in
            OTUtils.LogOut(error)
        }
    }
    
    //  获取用户个人信息
    func getUseInfo() {
        HttpHelper.Shared.Get(path: String(format: "/userInfo/project/%@/role", (OTCenter.shared.projectModel?.vid!)!), params: nil, success: { (jsonString, errorMessage) in
            if errorMessage != nil {
                OTUtils.LogOut(errorMessage);
            }
            
            let userModel = JSONDeserializer<OTUserInfoModel>.deserializeFrom(json: jsonString, designatedPath: "data")
            OTCenter.shared.vid = userModel?.vid
            if OTCenter.shared.userType == 0 {
                UIView.alertText(String(format: "您的账号在该项目中的角色为:%@ 没有登入权限", OTCenter.shared.vid!))
            } else {
                //  这里加友盟统计?
                self.getSiteList()
                
            }
        }) { (error) in
            OTUtils.LogOut(error)
        }
    }
    
    //  查询当前用户在项目中的可见中心列表
    func getSiteList() {
        
        HttpHelper.Shared.Get(path: String(format: "/userInfo/project/%@/sites", (OTCenter.shared.projectModel?.vid!)!), params: nil, success: { (jsonString, mes) in
//            OTUtils.LogOut(jsonString)
            if mes != nil {
                UIView.alertText(mes)
                return
            }
            if let arr = JSONDeserializer<OTSiteModel>.deserializeModelArrayFrom(json: jsonString, designatedPath: "data") {
                OTCenter.shared.siteArr = (arr as! [OTSiteModel])
                DispatchQueue.main.async {
                    keyWindow?.rootViewController = BaseTabbarController.root
                    BaseTabbarController.shared.reBuildControllers()
                }
                
            }
            
        }) { (error) in
            OTUtils.LogOut(error)
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



