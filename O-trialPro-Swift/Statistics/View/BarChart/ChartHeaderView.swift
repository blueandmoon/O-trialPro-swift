//
//  ChartHeaderView.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/7/5.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit

let k_chartTopSpace : CGFloat = 35.0
let k_chartBottomSpace : CGFloat = 50.0

class ChartHeaderView: UICollectionReusableView {
    
    var nodeOne: UILabel?
    var nodeTwo: UILabel?
    var nodeThree: UILabel?
    var peak: Double? {
        didSet {
            nodeThree?.text = String(format: "%.1f", peak!)
            nodeTwo?.text = String(format: "%.1f", peak!/3 * 2)
            nodeOne?.text = String(format: "%.1f", peak!/3)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    //  y轴上余10, 下距50
    func configUI() {
        self.backgroundColor = .white
        
        let hLine = UIView() //
        self.addSubview(hLine)
        hLine.backgroundColor = HexColor(OT_Light_Yellow)
        _ = hLine.sd_layout().rightEqualToView(self)?.widthIs(20)?.heightIs(1)?.bottomSpaceToView(self, k_chartBottomSpace)
        
        let vLine = UIView()
        self.addSubview(vLine)
        vLine.backgroundColor = HexColor(OT_Light_Yellow)
        _ = vLine.sd_layout().rightSpaceToView(hLine, -3)?.widthIs(1)?.bottomSpaceToView(self, k_chartBottomSpace - 2)?.topSpaceToView(self, 20)
        
        //  三个节点
        let node1 = UIView() //
        self.addSubview(node1)
        node1.backgroundColor = HexColor(OT_Light_Yellow)
        _ = node1.sd_layout().leftSpaceToView(vLine, 0)?.widthIs(3)?.topSpaceToView(vLine, -(self.ot_hei - k_chartBottomSpace - k_chartTopSpace)/3)?.heightIs(1)
        
        nodeOne = UILabel()
        self.addSubview(nodeOne!)
        nodeOne?.text = "18.0"
        nodeOne?.textAlignment = .right
        nodeOne?.textColor = HexColor(OT_Light_Yellow)
        nodeOne?.font = UIFont.systemFont(ofSize: 11)
        _ = nodeOne?.sd_layout().rightSpaceToView(vLine, 3)?.leftSpaceToView(self, 3)?.heightIs(15)?.centerYEqualToView(node1)
        
        let node2 = UIView() //
        self.addSubview(node2)
        node2.backgroundColor = HexColor(OT_Light_Yellow)
        _ = node2.sd_layout().leftSpaceToView(vLine, 0)?.widthIs(3)?.topSpaceToView(vLine, -(self.ot_hei - k_chartBottomSpace - k_chartTopSpace)/3 * 2)?.heightIs(1)
        
        nodeTwo = UILabel()
        self.addSubview(nodeTwo!)
        nodeTwo?.text = "2.0"
        nodeTwo?.textAlignment = .right
        nodeTwo?.textColor = HexColor(OT_Light_Yellow)
        nodeTwo?.font = UIFont.systemFont(ofSize: 11)
        _ = nodeTwo?.sd_layout().rightSpaceToView(vLine, 3)?.leftSpaceToView(self, 3)?.heightIs(15)?.centerYEqualToView(node2)
        
        let node3 = UIView() //
        self.addSubview(node3)
        node3.backgroundColor = HexColor(OT_Light_Yellow)
        _ = node3.sd_layout().leftSpaceToView(vLine, 0)?.widthIs(3)?.topSpaceToView(vLine, -(self.ot_hei - k_chartBottomSpace - k_chartTopSpace))?.heightIs(1)
        
        nodeThree = UILabel()
        self.addSubview(nodeThree!)
        nodeThree?.text = "3.0"
        nodeThree?.textAlignment = .right
        nodeThree?.textColor = HexColor(OT_Light_Yellow)
        nodeThree?.font = UIFont.systemFont(ofSize: 11)
        _ = nodeThree?.sd_layout().rightSpaceToView(vLine, 3)?.leftSpaceToView(self, 3)?.heightIs(15)?.centerYEqualToView(node3)
        
        let nodeZero = UILabel()
        self.addSubview(nodeZero)
        nodeZero.text = "0.0"
        nodeZero.textAlignment = .right
        nodeZero.textColor = HexColor(OT_Light_Yellow)
        nodeZero.font = UIFont.systemFont(ofSize: 11)
        _ = nodeZero.sd_layout().rightSpaceToView(vLine, 3)?.leftSpaceToView(self, 3)?.heightIs(15)?.centerYEqualToView(hLine)
        
        
        
    }
    
}
