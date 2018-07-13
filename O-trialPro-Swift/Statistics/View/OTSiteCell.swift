//
//  OTSiteCell.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/7/6.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit

class OTSiteCell: BaseTableViewCell {
    
    var lbl: UILabel?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    
    static func initCell(_ tableView: UITableView) -> OTSiteCell {
        let reuse = "OTSiteCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: "OTSiteCell")
        if cell == nil {
            cell = OTSiteCell(style: .default, reuseIdentifier: reuse)
        }
        cell?.selectionStyle = .none
        
        return cell as! OTSiteCell
    }
        
    
    override func configUI() {
        lbl = UILabel()
        contentView.addSubview(lbl!)
        lbl?.font = UIFont.systemFont(ofSize: 16)
        lbl?.textColor = HexColor(OT_Content_Gray)
        lbl?.textAlignment = .left
        _ = lbl?.sd_layout().leftSpaceToView(contentView, 15)?.rightEqualToView(contentView)?.centerYEqualToView(contentView)?.heightIs(20)
    }
    
    
}
