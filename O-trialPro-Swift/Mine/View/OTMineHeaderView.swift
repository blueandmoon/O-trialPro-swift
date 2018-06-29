//
//  OTMineHeaderView.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/25.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit
import Kingfisher

class OTMineHeaderView: UIView {

    var imgV: UIImageView?
    var nameLbl: UILabel?
    var wxLbl: UILabel?
    var waterView: WaterWaveView?
    
    var imgUrl: String? {
        didSet {
            imgV?.kf.setImage(with: URL(string: imgUrl!), placeholder: kPlaceholderImg_header, options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
    
    var name: String? {
        didSet {
            nameLbl?.text = name
        }
    }

    var wxName: String? {
        didSet {
            wxLbl?.text = wxName
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /// 子view
    func configUI() {
        self.backgroundColor = .clear
        
        waterView = WaterWaveView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 228), UIColor(hexString: "fbd49d", alpha: 0.7), UIColor(hexString: "ff785c", alpha: 0.7))
        self.addSubview(waterView!)
        
        let titleLbl = UILabel()
        self.addSubview(titleLbl)
        titleLbl.textColor = .white
        titleLbl.text = "我的".engString()
        titleLbl.textAlignment = .center
        _ = titleLbl.sd_layout().widthIs(80)?.centerXEqualToView(self)?.topSpaceToView(self, 33.5)?.heightIs(20)
        
        imgV = UIImageView(image: UIImage(named: "my_big_head"))
        self.addSubview(imgV!)
        imgV?.clipsToBounds = true
        _ = imgV?.sd_layout().centerXEqualToView(self)?.centerYEqualToView(self)?.heightIs(74)?.widthIs(74)
        imgV?.sd_cornerRadius = NSNumber(value: Double((imgV?.ot_hei)!/2))
        
        nameLbl = UILabel()
        self.addSubview(nameLbl!)
//        nameLbl?.text = "ceshi"
        nameLbl?.text = OTCenter.shared.realName
        nameLbl?.textColor = .white
        nameLbl?.textAlignment = .center
        _ = nameLbl?.sd_layout().centerXEqualToView(self)?.widthIs(200)?.heightIs(20)?.topSpaceToView(imgV, 15)
        
        wxLbl = UILabel()
        self.addSubview(wxLbl!)
        wxLbl?.textColor = .white
        wxLbl?.font = UIFont.systemFont(ofSize: 12)
//        wxLbl?.text = "ceshi"
        wxLbl?.text = OTCenter.shared.userNameWX;
        wxLbl?.textAlignment = .center
        _ = wxLbl?.sd_layout().centerXEqualToView(self)?.widthIs(200)?.heightIs(20)?.topSpaceToView(nameLbl, 5)
    }

}
