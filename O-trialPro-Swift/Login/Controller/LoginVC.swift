//
//  LoginVC.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/7.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit
import ObjectMapper
import HandyJSON
//import NVActivityIndicatorView

//为(_ num1: Int, _ num2: Int) -> (Int) 类型的闭包定义别名：Add
typealias Add = (_ num1: Int, _ num2: Int) -> (Int)

struct ParserData {
    var data: String?
    var errorCode: String?
    var errorMessage: String?
    var success: String?
    
}

class Person: Codable {
    var name: String = ""
    var age: Int = 0
    var score: Double = 0.00
    
    enum CodingKeys: String, CodingKey {
        case name = "name_a"
        case age
//        case score
    }
}

struct Template: Mappable {
    var name_a: String?
    var age: Int?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        name_a <- map["name_a"]
        age <- map["age"]
    }
}

class NetResponse: Codable {
    var data: String?
    var errorCode: String?
    var errorMessage: String?
    var success: Bool?
}

class LoginVC: BaseViewController, UITextFieldDelegate, YBAttributeTapActionDelegate {

    var nameTF : OTLoginTextField!
    var pwdTF : OTLoginTextField!
    
    
    deinit {
        OTUtils.LogOut("dealloc之")
    }
    
    //  MARK:   - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white;
//        UIApplication.shared.isStatusBarHidden = true
//        self.navigationController?.navigationBar.isHidden =  true
//
        
        configUI();
        view.whenTapped {
            self.view.endEditing(true)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    
    
    //  MARK: - views
    
    func configUI() {
        
        let logo = UIImage(named: "my_login_logo")
        let logoIV = UIImageView(image: logo)
        view.addSubview(logoIV)
//        logoIV.layer.borderWidth = 1
        _ = logoIV.sd_layout().centerXEqualToView(view)?.topSpaceToView(view, 80)?.widthIs((logo?.size.width)! * 1.5)?.heightIs((logo?.size.height)! * 1.5)
        
        nameTF = OTLoginTextField()
        view.addSubview(nameTF)
        nameTF.placeholder = "邮箱"
        nameTF.text = OTUtils.OTObject(OT_User_Email
        )
        nameTF.leftImg = UIImage(named: "my_login_user")
        _ = nameTF.sd_layout().centerXEqualToView(view)?.topSpaceToView(logoIV, 60)?.widthIs(view.bounds.size.width - 30)?.heightIs(45)
        
        pwdTF = OTLoginTextField()
        view.addSubview(pwdTF)
        pwdTF.isSecureTextEntry = true
        pwdTF.placeholder = "密码"
        pwdTF.text = OTUtils.OTObject(OT_User_Pwd)
        pwdTF.leftImg = UIImage(named: "my_login_password")
        _ = pwdTF.sd_layout().centerXEqualToView(view)?.topSpaceToView(nameTF, 15)?.widthIs(view.bounds.size.width - 30)?.heightIs(45)

        let loginBtn = UIButton(type: UIButtonType.custom)
        view.addSubview(loginBtn)
        loginBtn.setTitle("登录", for: .normal)
        loginBtn.sd_cornerRadiusFromHeightRatio = 0.5
        loginBtn.backgroundColor = UIColor(hexString: "f8f8f8")
        loginBtn.setTitleColor(UIColor(hexString: "ffffff"), for: .normal)
        _ = loginBtn.sd_layout().leftEqualToView(nameTF)?.rightEqualToView(nameTF)?.topSpaceToView(pwdTF, 15)?.heightRatioToView(pwdTF, 1.0)
        loginBtn.addTarget(self, action: #selector(self.loginClick(_:)), for: .touchUpInside)
        loginBtn.clickInterval = NSNumber(value: 1.0)
        loginBtn.didFinishAutoLayoutBlock = { (frame: CGRect) -> () in
            loginBtn.gradientLayerHorizontal("FF7F58".toUIColor(), "FDA21E".toUIColor())
        };
        
        let termsLbl = UILabel()
        view.addSubview(termsLbl)
        termsLbl.enabledTapEffect = true
        termsLbl.numberOfLines = NSIntegerMax
        termsLbl.font = UIFont.systemFont(ofSize: 13)
        let str = "登录代表您已同意 用户注册及APP使用协议 和 用户使用协议(方案)"
        let textArr = ["用户注册及APP使用协议", "用户使用协议(方案)"]
        
        termsLbl.yb_addAttributeTapAction(with: textArr, delegate: self)
        _ = termsLbl.sd_layout().leftEqualToView(loginBtn)?.rightEqualToView(loginBtn)?.topSpaceToView(loginBtn, 15)?.maxHeightIs(35)
//        termsLbl.text = str
        let nStr: NSString = str as NSString

        let range1 = nStr.range(of: textArr[0])
        let range2 = nStr.range(of: textArr[1])

        let attr = NSMutableAttributedString.init(string: str)

        attr.addAttributes([NSAttributedStringKey.foregroundColor: "376bfb".toUIColor(),
                             NSAttributedStringKey.underlineStyle: 1], range:range1)
        attr.addAttributes([NSAttributedStringKey.foregroundColor: "376bfb".toUIColor(),
                            kCTUnderlineStyleAttributeName as NSAttributedStringKey: 1], range: range2)
        termsLbl.attributedText = attr
        termsLbl.enabledTapEffect = false
        termsLbl.yb_addAttributeTapAction(with: textArr) { (string, range, index) in
            let url = URL(string: index == 0 ? "http://appc.o-trial.com:8888/usage-agreement.html": "http://appc.o-trial.com:8888/user-agreement.html")
            let web = OTWKWebController.init(url!)
            self.navigationController?.pushViewController(web, animated: true)
        }
    
        
        let versionLbl = UILabel()
        view.addSubview(versionLbl)
        versionLbl.textAlignment = .center
        versionLbl.text = "版本: \(shortVersion as! String)"
        _ = versionLbl.sd_layout().centerXEqualToView(view)?.widthIs(150)?.bottomSpaceToView(view, 20)?.heightIs(20)
        
        let wxIV = UIImageView(image: UIImage(named: "weixin2"))
        view.addSubview(wxIV)
        _ = wxIV.sd_layout().centerXEqualToView(versionLbl)?.widthIs(32)!.bottomSpaceToView(versionLbl, 10)?.heightIs(32)
        wxIV.whenTapped {   //  微信登录
            OTUtils.LogOut("微信登录")
        }
        
        
    }
    
    //  MARK: - events
    
    @objc func loginClick(_ button: UIButton) {
        
        if (nameTF.text?.count)! < 0 {
            OTUtils.LogOut("请输入用户名")
            return
        }
        if (pwdTF.text?.count)! < 0 {
            OTUtils.LogOut("请输入密码")
            return
        }
        
        let saltPwd = pwdTF.text! + OT_Salt
        let encoder = SHAEncoder()
        let encodedPass = encoder.getSha256String(encoder.getSha256String(saltPwd))
        
        let params = ["email": nameTF.text!, "passWord": encodedPass]
        UIView.startLoading()
        HttpHelper.Shared.Post(path: "/public/login", params: params as! Dictionary<String, String>, success: { (res, mes)  in
            if mes != nil {
                UIView.alertText(mes)
                return
            }
            
            if let model = JSONDeserializer<OTLoginModel>.deserializeFrom(json: res) {
                if model.success! {
                    OTCenter.shared.token = model.data
                    let vc = MyProjectVC()
                    DispatchQueue.main.async {
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
//                    UIApplication.shared.keyWindow?.rootViewController = vc
                    vc.logOut = {
                        self.logOut()
                    }
                    DispatchQueue.main.async {
                        OTUtils.OTSetObject(self.nameTF.text!, OT_User_Email)
                        OTUtils.OTSetObject(self.pwdTF.text!, OT_User_Pwd)
                    }
                    //  登录成功获取个人信息
                    self.getUserInfo()
                }
            }
        }) { (error) in
            OTUtils.LogOut(error)
            UIView.alertText(error.localizedDescription)
        }
    }
    
    //  MARK:   - data
    func getUserInfo() {
        HttpHelper.Shared.Get(path: "/user/selfInfo", params: nil, success: { (jsonString, mes) in
            if mes != nil {
                UIView.alertText(mes)
                return
            }
            if let model = JSONDeserializer<OTUserInfoModel>.deserializeFrom(json: jsonString, designatedPath: "data") {
                OTCenter.shared.realName = model.realName
                OTCenter.shared.vid = model.vid
                OTCenter.shared.userNameWX = model.userNameWX
                OTCenter.shared.projectCount = model.projectCount
            }
            
            
        }) { (error) in
            OTUtils.LogOut(error)
            UIView.alertText(error.localizedDescription);
        }
    }
    
    func logOut() {
        HttpHelper.Shared.Get(path: "/public/logout", params: nil, success: { (jsonString, mes) in
            if mes != nil {
                OTUtils.LogOut(String(format: "退出登录失败"))
            }
            OTUtils.LogOut(String(format: "退出登录成功"))
        }) { (error) in
            OTUtils.LogOut(error.localizedDescription);
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
