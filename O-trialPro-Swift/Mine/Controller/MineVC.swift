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
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        let cell = self.tableView(tableView, cellForRowAt: indexPath)
        return cell.cellHeight as! CGFloat
    }
    
    
    //  MARK:   - event
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.row == 0 {   //  切换语言
//            if OTUtils.OTObject(OT_Language_key) == "1" {
//                OTUtils.OTSetObject("0", OT_Language_key)
//            } else {
//                OTUtils.OTSetObject("1", OT_Language_key)
//            }
//            BaseTabbarController.shared.reBuildControllers()
//        }
        let model = list?[indexPath.row];
        switch model?.title {
        case "工时薄":
//            OTUtils.LogOut(model?.title)
            let webVC = OTWKWebController.init(URL(string: String(format: "%@/timesheet/my", base_Url))!)
            self.navigationController?.pushViewController(webVC, animated: true)
            break
        case "新手指引":
            let web = OTWKWebController.init((URL(string: "https://appc.o-trial.com:9009/download/O-TrialPro%E4%BD%BF%E7%94%A8%E6%89%8B%E5%86%8C-APP%E7%AB%AF.pdf"))!)
            self.navigationController?.pushViewController(web, animated: true)
            break
        case "公共直播室":
            let web = OTWKWebController.init(URL(string: String(format: "http://live.oceanus-plus.cn/House/list/%@", (OTCenter.shared.projectModel?.orgId)!))!)
            self.navigationController?.pushViewController(web, animated: true)
        case "受试者库":
            //  爬到受试者库
            break
        case "我的项目":
            let vc = MyProjectVC()
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case "离线图片":
            self.navigationController?.pushViewController(OffLinePictureVC(), animated: true)
            break
        case "我的协议":
            self.navigationController?.pushViewController(MyProtocolVC(), animated: true)
            break
        case "意见反馈":
            let web = OTWKWebController.init(URL(string: String(format: "%@/tofeedback", base_Url))!)
            self.navigationController?.pushViewController(web, animated: true)
            break
        case "设置":
            let vc = SettingVC()
            vc.arr = list![indexPath.row].items as? Array<OTMineModel>
            self.navigationController?.pushViewController(vc, animated: true)
            break
            
            
        default:
            return
        }
        
        
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
