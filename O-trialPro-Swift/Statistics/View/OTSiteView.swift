//
//  OTSiteView.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/7/6.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit

/// 筛选范围, 中心列表
class OTSiteView: UIView, UITableViewDelegate, UITableViewDataSource {

    var botV: UIView?
//    var siteV: OTSiteView?
    var tb: BaseTableView?
    var list: [OTSiteModel]?
    var seletedDone: ((_ siteModel: OTSiteModel) -> ())?
    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
    
    static func showSiteView(selectedDone: @escaping ((_ siteModel: OTSiteModel)->())) {
        
        let botV = UIView(frame: (keyWindow?.bounds)!)
        keyWindow?.addSubview(botV)
        botV.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        
        let siteV = OTSiteView()
        keyWindow?.addSubview(siteV)
        siteV.botV = botV
        siteV.seletedDone = selectedDone
        siteV.layer.cornerRadius = 10
        siteV.clipsToBounds = true
        siteV.backgroundColor = UIColor.white
        _ = siteV.sd_layout().rightEqualToView(keyWindow)?.widthIs(250)?.topSpaceToView(keyWindow, kNavHeight)?.heightIs(300)
        
        siteV.tb = BaseTableView(frame: siteV.bounds, style: .plain)
        siteV.addSubview(siteV.tb!)
        siteV.tb?.delegate = siteV
        siteV.tb?.dataSource = siteV
        
        siteV.getData()
        
        _ = siteV.sd_resetLayout().rightEqualToView(keyWindow)?.widthIs(250)?.topSpaceToView(keyWindow, kNavHeight)?.heightIs(CGFloat((siteV.list?.count)!)*40)
        
        botV.whenTapped {
            botV.removeFromSuperview()
            siteV.removeFromSuperview()
        }
    }
    
    //  MARK:   - tbDelegate & tbDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = OTSiteCell.initCell(tableView)
        cell.lbl?.text = list![indexPath.row].siteName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }
    
    //  MARK:   - event
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.seletedDone != nil {
            self.seletedDone!(list![indexPath.row])
        }
        self.removeFromSuperview()
        self.botV?.removeFromSuperview()
    }
    
    //  MARK:   - data
    
    func getData() {
        
        list = Array()
        
        let m = OTSiteModel()
        m.siteName = "所有中心".engString()
        m.vid = nil
        
        list!.append(m)
        list!.append(contentsOf: OTCenter.shared.siteArr!)
        
        tb?.reloadData()
    }
    
    

}
