//
//  BarChart.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/7/4.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit

class BarChart: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {

    let k_chartHeaderSpace: CGFloat = 50.0
    
    
    var cv: BaseCollectionView?
    var titleLbl: UILabel?
    var peak: Double? = 3.0 //  y轴最大值
    var arr: [OTSubNumModel]? {
        didSet {
            var p: Double = 0
            var total: Int = 0
            for m: OTSubNumModel in arr! {
                if let subNum = m.subjectNum {
                    total = Int(subNum)! + total
                    if Double(subNum)! > p {
                        p = Double(subNum)!
                    }
                }
            }
            OTUtils.LogOut("刷新")
            peak = ceil(p/3.0) * 3
            DispatchQueue.main.async {
                self.titleLbl?.text = String(format: "  %@: %d", "受试者总数".engString()!, total)
                self.cv?.reloadData()
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
        self.backgroundColor = .white
        
        let layout = UICollectionViewFlowLayout()
        if #available(iOS 9.0, *) {
            layout.sectionHeadersPinToVisibleBounds = true
        } else {
            // Fallback on earlier versions
        }
        layout.scrollDirection = .horizontal
        cv = BaseCollectionView(frame: CGRect(x: 0, y: k_chartHeaderSpace, width: self.ot_wid - 15, height: self.ot_hei - k_chartHeaderSpace), collectionViewLayout: layout)
        self.addSubview(cv!)
        cv?.delegate = self
        cv?.dataSource = self
        cv?.register(ChartHeaderView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "ChartHeaderView")
        cv?.register(ChartNormalCell.classForCoder(), forCellWithReuseIdentifier: "ChartNormalCell")
        cv?.backgroundColor = .white
        cv?.bounces = false
        cv?.showsHorizontalScrollIndicator = false
        
        let tf = UITextField()
        self.addSubview(tf)
        tf.text = " 人数"
        tf.textColor = UIColor(hexString: OT_Light_Yellow)
        tf.font = UIFont.systemFont(ofSize: 11)
        tf.leftViewMode = .always
        let leftV = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        leftV.backgroundColor = UIColor(hexString: OT_Light_Yellow)
        tf.leftView = leftV
        tf.isUserInteractionEnabled = false
        _ = tf.sd_layout().leftSpaceToView(self, 15)?.widthIs(50)?.heightIs(15)?.topSpaceToView(self, 55)
        
        titleLbl = UILabel()
        self.addSubview(titleLbl!)
        titleLbl?.frame = CGRect(x: 0, y: 0, width: self.ot_wid, height: k_chartHeaderSpace);
        titleLbl?.textAlignment = .left
        titleLbl?.textColor = UIColor(hexString: OT_Content_Gray)
        titleLbl?.text = "  受试者总数: ".engString()
        titleLbl?.backgroundColor = .white
        
    }
    
    //  MARK:   - cvDelegate & cvDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ChartNormalCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChartNormalCell", for: indexPath) as! ChartNormalCell
        
        cell.heiScale = CGFloat(Double(arr![indexPath.row].subjectNum!)!/peak!)
        cell.numLbl?.text = arr![indexPath.row].subjectNum!
        cell.nameLbl?.text = arr![indexPath.row].visitCode
        cell.index = indexPath.row
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: self.ot_hei - k_chartHeaderSpace)
//        return indexPath.row == 0 ? CGSize(width: 80, height: self.ot_hei - headerSpace) : CGSize(width: 50, height: self.ot_hei - headerSpace)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let v = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "ChartHeaderView", for: indexPath) as! ChartHeaderView
            v.peak = peak
            
            return v
        }
        
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 60, height: self.ot_hei - k_chartHeaderSpace)
    }
    
    
    
    
    
    //  MARK:   - event
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        OTUtils.LogOut("...")
    }
    
    
    
    

}
