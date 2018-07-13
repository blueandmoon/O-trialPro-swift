//
//  OTProjectDetailCell.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/7/12.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit

class OTProjectDetailCell: BaseTableViewCell {

    var lbl: UILabel?
    
    static func initCellWithTable(_ tableView: UITableView) -> OTProjectDetailCell {
        let reuse = "OTProjectDetailCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuse)
        if cell == nil {
            cell = OTProjectDetailCell(style: .default, reuseIdentifier: reuse)
        }
        cell?.selectionStyle = .none

        return cell as! OTProjectDetailCell
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configUI() {
        
        lbl = UILabel()
        contentView.addSubview(lbl!)
        lbl?.font = UIFont.systemFont(ofSize: 15)
        lbl?.textColor = HexColor(OT_Content_Gray)
        _ = lbl?.sd_layout().leftSpaceToView(contentView, 15)?.rightSpaceToView(contentView, 15)?.heightIs(20)?.centerYEqualToView(contentView)
        
        let line = UIView(frame: CGRect(x: 15, y: contentView.height - 1, width: contentView.width - 15, height: 1))
        contentView.addSubview(line)
        line.backgroundColor = HexColor(OT_Main_Bg)
        
        
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
