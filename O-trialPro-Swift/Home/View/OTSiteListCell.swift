//
//  OTSiteListCell.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/7/13.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit
//import SnapKit

class OTSiteListCell: BaseTableViewCell {

    var titleLbl: UILabel?
    var contentLbl: UILabel?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    static func initCell(_ tableView: UITableView) -> OTSiteListCell {
        let reuse = "OTSiteListCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuse)
        if cell == nil {
            cell = OTSiteListCell.init(style: .default, reuseIdentifier: reuse)
        }
        cell?.selectionStyle = .none
        
        return cell as! OTSiteListCell
    }
    
    override func configUI() {
        
        titleLbl = UILabel()
        contentView.addSubview(titleLbl!)
        titleLbl?.text = "ceshi"
        titleLbl?.font = UIFont.systemFont(ofSize: 15)
        titleLbl?.textColor = HexColor(OT_Content_Gray)
        titleLbl?.snp.makeConstraints({ (make) in
            make.left.equalTo(contentView).offset(15)
            make.right.equalTo(contentView).offset(-15)
            make.top.equalTo(contentView).offset((5))
            make.height.equalTo(20)
        });
        
        
        
        contentLbl = UILabel()
        contentView.addSubview(contentLbl!)
        contentLbl?.text = "ceshi"
        contentLbl?.font = UIFont.systemFont(ofSize: 13)
        contentLbl?.textColor = HexColor(OT_SubText_Gray)
        contentLbl?.snp.makeConstraints({ (make) in
            make.size.left.equalTo(titleLbl!)
            make.top.equalTo((titleLbl?.snp.bottom)!).offset(5)
        })
        
//        titleLbl?.layer.borderWidth = 1
//        contentLbl?.layer.borderWidth = 1
        
        let line = UIView()
        contentView.addSubview(line)
        line.backgroundColor = HexColor(OT_Main_Bg)
        line.snp.makeConstraints { (make) in
            make.left.bottom.equalTo(contentView)
            make.size.equalTo(CGSize(width: contentView.width, height: 1))
        }
        
        self.cellHeight = NSNumber(value: 60)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
