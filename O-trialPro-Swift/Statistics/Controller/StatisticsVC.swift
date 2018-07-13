//
//  StatisticsVC.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/24.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit
import HandyJSON

class StatisticsVC: BaseViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {

    var siteArea: String?
    var subList: [OTSubNumModel]?
//    var chart : BarChart?
    var header: OTStsHeaderView? 
    var cv: BaseCollectionView?
    var list: [OTStsModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "统计".engString()
        addRightButton("筛选范围".engString()!)

        configUI()
        getChartData()
        getStsData()
    }
    
    //  MARK:   - view
    override func configUI() {
        
        
//        chart = BarChart(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 300))
//        view.addSubview(chart!)
        
        let layout = UICollectionViewFlowLayout()
        cv = BaseCollectionView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - kNavHeight - kTabbarHeight), collectionViewLayout: layout)
        view.addSubview(cv!)
        cv?.delegate = self
        cv?.dataSource = self
        cv?.backgroundColor = .white
        cv?.register(OTStatisticCell.classForCoder(), forCellWithReuseIdentifier: "OTStatisticCell")
        cv?.register(OTStsHeaderView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "OTStsHeaderView")
        cv?.showsVerticalScrollIndicator = false
        
        
    }
    
    //  MARK:   - cvDelegate & cvDataSource
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OTStatisticCell", for: indexPath) as! OTStatisticCell
        cell.model = list![indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 65, height: 65)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            var header: OTStsHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "OTStsHeaderView", for: indexPath) as! OTStsHeaderView
//            header.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: 371)
//            chart = header.chart
            self.header = header

            return header
        }

        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 0, height: 371)
    }
    
    //  MARK:   - event
    
    override func rightButtonClick(_ rightItem: UIBarButtonItem) {
        OTSiteView.showSiteView { (siteModel) in
            self.siteArea = siteModel.vid
            self.getStsData()
            self.getChartData()
            self.header?.midTitleLbl?.text = String(format: "%@: %@", "关注点", siteModel.siteName!)
        }
        
    }
    
    //  MARK:   - data
    
    
    func getChartData() {
        var params: [String: String] = [:]
        //        if OTCenter.shared.projectModel?.vid != nil {
        //            params["projectId"] = OTCenter.shared.projectModel?.vid
        //        }
        if self.siteArea != nil {
            params["siteId"] = self.siteArea;
        }
        LogOut(params)
//        weak var weakSelf = self
        let path = String(format: "/project/%@/subjectCountInVisit", (OTCenter.shared.projectModel?.vid)!)
        HttpHelper.Shared.Get(path: path, params: params, success: { (jsonString, mes) in
            if mes != nil {
                UIView.alertText(mes)
                return
            }
            LogOut(jsonString)
            if let arr = JSONDeserializer<OTSubNumModel>.deserializeModelArrayFrom(json: jsonString, designatedPath: "data") {
//                LogOut(String(format: "%d", arr.count))
                self.cv?.reloadData()
                DispatchQueue.main.async {
                    self.header?.chart?.arr = arr as? [OTSubNumModel]
                }

            }
        }) { (error) in
            LogOut(error.localizedDescription);
        }
        
    }
    
    func getStsData() {
        
        let arr = NSMutableArray(contentsOfFile: Bundle.main.path(forResource: "StatisticsData.plist", ofType: nil)!)
        
//        LogOut(arr)
        list = Array()
        for dic in arr! {
            let model = OTStsModel()
            let dic = dic as! [String: Any?]
            model.title = dic["title"] as? String
            model.enName = dic["enName"] as? String
            model.num = String(format: "%@", (dic["num"] as? NSNumber)!)
            list?.append(model)
        }
        
        var params: [String: String] = [:]
        params["projectId"] = OTCenter.shared.projectModel?.vid
        if siteArea != nil {
            params["siteId"] = siteArea
        }
        LogOut(params)
        
//        weak var weakSelf = self
        HttpHelper.Shared.Get(path: String(format: "/project/%@/focus", (OTCenter.shared.projectModel?.vid)!), params: params, success: { (jsonString, mes) in
            if mes != nil {
                UIView.alertText(mes)
                return
            }
//            LogOut(jsonString)
            let data = jsonString?.data(using: String.Encoding.utf8, allowLossyConversion: true)
            var values = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String: Any?]
            if let dic = values!["data"] {
                LogOut(dic)
                let dic: [String: Any?] = dic as! [String : Any?]
                for key in dic.keys {
                    for m in self.list! {
                        if m.enName == key {
                            if dic[key] != nil {
                                m.num = String(format: "%@", (dic[key] as? NSNumber)!)
//                                LogOut("\(m.num, dic[key])")
                            }
                        }
                    }
                }
                self.cv?.reloadData()
                self.header?.chart?.cv?.reloadData()
            }
//            LogOut(values)
            
        }) { (error) in
            LogOut(error.localizedDescription)
        }
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
