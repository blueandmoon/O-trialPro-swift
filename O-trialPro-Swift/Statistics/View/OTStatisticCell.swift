//
//  OTStatisticCell.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/7/6.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit

class OTStatisticCell: UICollectionViewCell {
    
    var titleLbl: UILabel?
    var numLbl: UILabel?
    var model: OTStsModel? {
        didSet {
            titleLbl?.text = model?.title?.engString()
            numLbl?.text = model?.num
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configUI() {
//        contentView.layer.borderWidth = 1
        
        titleLbl = UILabel()
        contentView.addSubview(titleLbl!)
        titleLbl?.font = UIFont.systemFont(ofSize: 13)
        titleLbl?.textAlignment = .center
        titleLbl?.textColor = HexColor(OT_Content_Gray)
        _ = titleLbl?.sd_layout().leftEqualToView(contentView)?.rightEqualToView(contentView)?.topSpaceToView(contentView, 10)?.heightIs(20)
        
        numLbl = UILabel()
        contentView.addSubview(numLbl!)
        numLbl?.font = UIFont.systemFont(ofSize: 17)
        numLbl?.textAlignment = .center
        numLbl?.textColor = HexColor(OT_Title_Black)
        _ = numLbl?.sd_layout().leftEqualToView(contentView)?.rightEqualToView(contentView)?.bottomSpaceToView(contentView, 15)?.heightIs(20)
        
//        titleLbl?.text = "随机人数"
//        numLbl?.text = "ceshi"
    }
    
    
}
