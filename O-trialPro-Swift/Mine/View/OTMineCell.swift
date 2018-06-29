//
//  OTMineCell.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/24.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit

class OTMineCell: BaseTableViewCell {

    var leftIV: UIImageView?
    var contentLbl: UILabel?
    var topLine: UIView?
    var bottomLine: UIView?
    var model: OTMineModel? {
        didSet {
            leftIV?.image = UIImage(named: (model?.img)!)
            contentLbl?.text = model?.title?.engString()
        }
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    static func initMineCell(_ tableView: UITableView) -> OTMineCell {
        let resuse = "OTMineCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: resuse)
        if cell == nil {
            cell = OTMineCell(style: .default, reuseIdentifier: resuse)
        }
        cell?.selectionStyle = .none
        
        return cell as! OTMineCell
    }
    
    func configUI() {
        
        let arrowIV = UIImageView(image: UIImage(named: "calendar_arrow_right"))
        contentView.addSubview(arrowIV)
        arrowIV.contentMode = .center
        _ = arrowIV.sd_layout().rightSpaceToView(contentView, 15)?.widthIs(20)?.centerYEqualToView(contentView)?.heightIs(20)
        
        leftIV = UIImageView(image: UIImage(named: "ddd"))
        contentView.addSubview(leftIV!)
        _ = leftIV?.sd_layout().leftSpaceToView(contentView, 15)?.widthIs(30)?.centerYEqualToView(contentView)?.heightIs(30)
        
        contentLbl = UILabel()
        contentView.addSubview(contentLbl!)
        _ = contentLbl?.sd_layout().leftSpaceToView(leftIV, 5)?.rightSpaceToView(arrowIV, 5)?.centerYEqualToView(contentView)?.heightIs(20)
        
        topLine = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 0.7))
        contentView.addSubview(topLine!)
        topLine?.isHidden = true
        topLine?.backgroundColor = "dddddd".toUIColor()

//        bottomLine = UIView(frame: CGRect(x: 0, y: contentView.ot_hei - 1, width: kScreenWidth, height: 0.7))
//        contentView.addSubview(bottomLine!)
//        bottomLine?.isHidden = true
//        bottomLine?.backgroundColor = "dddddd".toUIColor()
        
        self.cellHeight = NSNumber(value: 50)
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
