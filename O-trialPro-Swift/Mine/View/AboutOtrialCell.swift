//
//  AboutOtrialCell.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/6/20.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit

class AboutOtrialCell: BaseTableViewCell {

    var leftLbl: UILabel?
    var rightLbl: UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    static func initTableCell(_ tableView: UITableView) -> AboutOtrialCell {
        let reuse = "AboutOtrialCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuse)
        if cell == nil {
            cell = AboutOtrialCell(style: .default, reuseIdentifier: reuse)
        }
        cell?.selectionStyle = .none
        
        return cell as! AboutOtrialCell
    }
    
    override func configUI() {
        
        leftLbl = UILabel()
        contentView.addSubview(leftLbl!)
        leftLbl?.font = UIFont.systemFont(ofSize: 16)
        leftLbl?.textColor = HexColor(OT_Content_Gray)
        leftLbl?.sd_layout().leftSpaceToView(contentView, 15)?.widthIs(150)?.heightIs(20)?.centerYEqualToView(contentView)
        
        rightLbl = UILabel()
        contentView.addSubview(rightLbl!)
        rightLbl?.textAlignment = .right
        rightLbl?.font = UIFont.systemFont(ofSize: 16)
        rightLbl?.textColor = HexColor(OT_Content_Gray)
        rightLbl?.sd_layout().rightSpaceToView(contentView, 15)?.widthIs(150)?.heightIs(20)?.centerYEqualToView(contentView)
        
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
