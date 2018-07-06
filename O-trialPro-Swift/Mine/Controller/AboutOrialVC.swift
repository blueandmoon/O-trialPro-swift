//
//  AboutOrialVC.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/6/20.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit

class AboutOrialVC: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    var listView: BaseTableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "关于我们"

        configUI()
    }
    
    func configUI() {
        
        listView = BaseTableView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - kNavHeight), style: .plain)
        view.addSubview(listView!)
        listView?.delegate = self
        listView?.dataSource = self
        listView?.tableFooterView = UIView()
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 300))
        listView?.tableHeaderView = header
        
        let iv = UIImageView(image: UIImage(named: "aboutLogo"))
        header.addSubview(iv)
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 10
        iv.contentMode = .scaleAspectFill
        _ = iv.sd_layout().centerXEqualToView(header)?.widthIs(100)?.heightIs(100)?.topSpaceToView(header, 75)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = AboutOtrialCell.initTableCell(tableView)
        
        if indexPath.row == 0 {
            cell.leftLbl?.text = "软件版本"
            cell.rightLbl?.text = String(format: "%@", shortVersion as! CVarArg)
        } else {
            cell.leftLbl?.text = "管理员电话"
            cell.rightLbl?.text = "0512-87899988"
            cell.whenTapped {
                let url = URL(string: "tel:0512-87899988")
                UIApplication.shared.openURL(url!)
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
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
