//
//  SettingVC.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/6/19.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit

class SettingVC: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    var arr : Array<OTMineModel>?
//    {
//        didSet {
//            OTUtils.LogOut(arr?.count)
//            listView?.reloadData()
//        }
//    }
    var listView: BaseTableView?
    
//    deinit {
//        OTUtils.LogOut("dealloc之")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "设置"
        
        confiUI()
    }
    
    //  MARK: - view
    
    func confiUI() {
        listView = BaseTableView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - kNavHeight), style: .plain)
//        listView = BaseTableView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - kNavHeightL, style: .plain)
        view.addSubview(listView!)
        listView?.delegate = self
        listView?.dataSource = self
        listView?.tableFooterView = UIView()
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = OTMineCell.initMineCell(tableView)
        cell.model = arr?[indexPath.row]
        
        return cell
    }
    
    //  MARK: - event
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch arr![indexPath.row].title {
        case "关于O-trial":
            self.navigationController?.pushViewController(AboutOrialVC(), animated: true)
            break
        case "切换语言":
            if OTUtils.OTObject(OT_Language_key) == "1" {
                OTUtils.OTSetObject("0", OT_Language_key)
            } else {
                OTUtils.OTSetObject("1", OT_Language_key)
            }
//            keyWindow?.rootViewController = BaseTabbarController.root
            BaseTabbarController.shared.reBuildControllers()
            break
        case "修改密码":
            self.navigationController?.pushViewController(ModifyPwdVC(), animated: true)
            break
        case "退出登录":
            logOut()
            break
        default:
            break
        }
        
        
    }
    
    func logOut() {
        HttpHelper.Shared.Get(path: "/public/logout", params: nil, success: { (jsonString, mes) in
            if mes != nil {
                UIView.alertText(mes)
                return
            }
            DispatchQueue.main.async {
                UIApplication.shared.keyWindow?.rootViewController = BaseNavigationController(rootViewController: LoginVC())
            }
            
        }) { (error) in
            OTUtils.LogOut(error.localizedDescription)
        }
    }
    
    //  MARK: - data
    
    
    

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
