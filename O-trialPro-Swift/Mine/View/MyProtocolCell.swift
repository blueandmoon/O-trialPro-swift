//
//  MyProtocolCell.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/6/20.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit

class MyProtocolCell: BaseTableViewCell {

    var lbl: UILabel?
    var iv: UIImageView?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    static func initTableCell(_ tableView: UITableView) -> MyProtocolCell {
        let reuse = "MyProtocolCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuse)
        if cell == nil {
            cell = MyProtocolCell(style: .default, reuseIdentifier: reuse)
        }
        cell?.selectionStyle = .none
        
        return cell as! MyProtocolCell
    }
    
    override func configUI() {
        
        lbl = UILabel()
        contentView.addSubview(lbl!)
        lbl?.text = "我的协议"
        lbl?.font = UIFont.systemFont(ofSize: 16);
        lbl?.textColor = HexColor(OT_Content_Gray)
        lbl?.sd_layout().leftSpaceToView(contentView, 15)?.rightSpaceToView(contentView, 100)?.centerYEqualToView(contentView)?.heightIs(20)
        
        iv = UIImageView(image: UIImage(named: "calendar_arrow_right"))
        contentView.addSubview(iv!)
        iv?.contentMode = .center
        iv?.sd_layout().rightSpaceToView(contentView, 15)?.widthIs(20)?.centerYEqualToView(contentView)?.heightIs(20);
        
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
