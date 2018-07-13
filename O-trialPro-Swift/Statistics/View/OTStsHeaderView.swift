//
//  OTStsHeaderView.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/7/6.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit

class OTStsHeaderView: UICollectionReusableView {
    
    var chart: BarChart?
    var midTitleLbl: UILabel?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    func configUI() {
        chart = BarChart(frame: CGRect(x: 0, y: 0, width: self.ot_wid, height: 300))
        self.addSubview(chart!)
        
        let grayBar = UIView(frame: CGRect(x: 0, y: 300, width: self.ot_wid, height: 30))
        self.addSubview(grayBar)
        grayBar.backgroundColor = HexColor(OT_Tiny_Gray)
        
        midTitleLbl = UILabel()
        self.addSubview(midTitleLbl!)
        midTitleLbl?.text = String(format: "%@: %@", "关注点".engString()!, "所有中心".engString()!)
        midTitleLbl?.font = UIFont.systemFont(ofSize: 16)
        midTitleLbl?.textColor = HexColor(OT_Content_Gray)
        _ = midTitleLbl?.sd_layout().leftSpaceToView(self, 15)?.rightSpaceToView(self, 15)?.topSpaceToView(grayBar, 0 )?.heightIs(40)
        
        let line = UIView()
        self.addSubview(line)
        line.backgroundColor = HexColor(OT_Tiny_Gray)
        _ = line.sd_layout().leftEqualToView(midTitleLbl)?.rightEqualToView(midTitleLbl)?.topSpaceToView(midTitleLbl,0)?.heightIs(1)
        
        
    }
}
