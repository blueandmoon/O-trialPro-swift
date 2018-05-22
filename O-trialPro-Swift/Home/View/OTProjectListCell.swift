//
//  OTProjectListCell.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/21.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit

class OTProjectListCell: UITableViewCell {

    var titleLbl: UILabel?
    var contentLbl: UILabel?
    var dateLbl: UILabel?
    var model: OTProjectModel? {
        didSet {
            titleLbl?.text = model?.projectName
            contentLbl?.text = model?.projectNo
            dateLbl?.text = model?.createTime
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    static func initCellWithTable(_ tableView: UITableView) -> OTProjectListCell {
        let reuse = "OTProjectListCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuse)
        if cell == nil {
            cell = OTProjectListCell(style: .default, reuseIdentifier: reuse)
        }
        cell?.selectionStyle = .none
        
        return cell as! OTProjectListCell
    }
    
    func configUI() {
        self.contentView.backgroundColor = OT_Main_Bg.toUIColor()
        
        let bgView = UIView()
        self.contentView.addSubview(bgView)
        bgView.backgroundColor = .white
        bgView.layer.cornerRadius = 10
        bgView.clipsToBounds = true
        _ = bgView.sd_layout().leftSpaceToView(self.contentView, 15)?.widthIs(kScreenWidth - 30)?.topEqualToView(self.contentView)?.heightRatioToView(self.contentView, 1.0)
        
        titleLbl = UILabel()
        bgView .addSubview(titleLbl!)
        titleLbl?.textColor = OT_Content_Gray.toUIColor()
        titleLbl?.font = UIFont.systemFont(ofSize: 15)
        _ = titleLbl?.sd_layout().leftSpaceToView(bgView, 8)?.rightSpaceToView(bgView, 8)?.heightIs(20)?.topSpaceToView(bgView, 5)
        
        contentLbl = UILabel()
        bgView.addSubview(contentLbl!)
        contentLbl?.textColor = OT_Title_Black.toUIColor()
        contentLbl?.font = UIFont.systemFont(ofSize: 14)
        _ = contentLbl?.sd_layout().leftEqualToView(titleLbl)?.rightEqualToView(titleLbl)?.heightIs(20)?.topSpaceToView(titleLbl, 5)
        
        dateLbl = UILabel()
        bgView .addSubview(dateLbl!)
        dateLbl?.textColor = OT_SubText_Gray.toUIColor()
        dateLbl?.font = UIFont.systemFont(ofSize: 12)
        _ = dateLbl?.sd_layout().leftEqualToView(titleLbl)?.rightEqualToView(titleLbl)?.heightIs(20)?.bottomSpaceToView(bgView, 5)
        
//        titleLbl?.layer.borderWidth = 1
//        contentLbl?.layer.borderWidth = 1
//        dateLbl?.layer.borderWidth = 1
        
        self.cellHeight = NSNumber(value: 80)
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
