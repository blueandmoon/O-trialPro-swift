//
//  ChartNormalCell.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/7/5.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit

class ChartNormalCell: UICollectionViewCell {
    
    var nameLbl: UILabel?
    public var lump: UIView?
    var numLbl: UILabel?
    var heiScale: CGFloat? { //  高度系数 0 ~ 1.0
        didSet {
            let hei: CGFloat = (contentView.ot_hei - k_chartBottomSpace - k_chartTopSpace) * heiScale!
            _ = lump?.sd_resetLayout().bottomSpaceToView(contentView, k_chartBottomSpace)?.widthIs(30)?.heightIs(hei)?.centerXEqualToView(nameLbl)
        }
    }
    var index: Int? {
        didSet {
            if index!%2 == 0 {
                _ = nameLbl?.sd_resetLayout().leftSpaceToView(contentView, 1)?.rightSpaceToView(contentView, 1)?.heightIs(15)?.bottomSpaceToView(contentView, 5 + 15)
            } else {
                _ = nameLbl?.sd_layout().leftSpaceToView(contentView, 1)?.rightSpaceToView(contentView, 1)?.heightIs(15)?.bottomSpaceToView(contentView, 5)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    func configUI() {
        contentView.backgroundColor = .white
        
        nameLbl = UILabel()
        contentView.addSubview(nameLbl!)
        nameLbl?.text = "ceshi"
//        nameLbl?.layer.borderWidth = 1
        nameLbl?.textAlignment = .center
        nameLbl?.font = UIFont.systemFont(ofSize: 11)
        nameLbl?.textColor = UIColor(hexString: OT_Light_Yellow)
        _ = nameLbl?.sd_layout().leftSpaceToView(contentView, 1)?.rightSpaceToView(contentView, 1)?.heightIs(15)?.bottomSpaceToView(contentView, 5)
        
        let line = UIView()
        contentView.addSubview(line)
        line.backgroundColor = UIColor(hexString: OT_Light_Yellow)
        _ = line.sd_layout().leftEqualToView(contentView)?.rightEqualToView(contentView)?.heightIs(1)?.bottomSpaceToView(contentView, 50)
        
        lump = UIView()
        contentView.addSubview(lump!)
        lump?.backgroundColor = UIColor(hexString: OT_Light_Yellow)
        _ = lump?.sd_layout().bottomSpaceToView(contentView, k_chartBottomSpace)?.widthIs(30)?.heightIs(contentView.ot_hei - k_chartBottomSpace - k_chartTopSpace)?.leftSpaceToView(contentView, (self.ot_wid - 30)/2)
        
        numLbl = UILabel()
        contentView.addSubview(numLbl!)
        numLbl?.textAlignment = .center
        numLbl?.font = UIFont.systemFont(ofSize: 13)
        numLbl?.textColor = UIColor(hexString: OT_Light_Yellow)
        _ = numLbl?.sd_layout().leftEqualToView(contentView)?.rightEqualToView(contentView)?.heightIs(15)?.bottomSpaceToView(lump, 2)
        
    }
    
    
    
}
