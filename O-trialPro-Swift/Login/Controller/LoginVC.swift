//
//  LoginVC.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/7.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit
import ObjectMapper


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

class LoginVC: UIViewController, UITextFieldDelegate, YBAttributeTapActionDelegate {

    var nameTF : OTLoginTextField!
    var pwdTF : OTLoginTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white;
        UIApplication.shared.isStatusBarHidden = true
        
        configUI();
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(self.tapClick(_:)))
        view.addGestureRecognizer(tap)
        
        
        //json字符串
        let JSONString = "{\"name_a\":\"xiaoming\",\"age\":10, \"score\":98.5}"
        guard let jsonData = JSONString.data(using: .utf8) else {
            return
        }
        let decoder = JSONDecoder()
        guard let obj = try? decoder.decode(Person.self, from: jsonData) else {
            return
        }
        
        OTUtils.LogOut(obj.name)
        let stu = Template(JSONString: JSONString)
        OTUtils.LogOut(stu)
        
        
        
        
    }
    
    //  MARK: - views
    
    func configUI() {
        
        let logo = UIImage(named: "my_login_logo")
        let logoIV = UIImageView(image: logo)
        view.addSubview(logoIV)
        _ = logoIV.sd_layout().centerXEqualToView(view)?.topSpaceToView(view, (logo?.size.height)!)?.widthIs((logo?.size.width)!)?.heightIs(120)
        
        nameTF = OTLoginTextField()
        view.addSubview(nameTF)
        nameTF.placeholder = "邮箱"
        nameTF.leftImg = UIImage(named: "my_login_user")
        _ = nameTF.sd_layout().centerXEqualToView(view)?.topSpaceToView(logoIV, 80)?.widthIs(view.bounds.size.width - 30)?.heightIs(45)
        
        pwdTF = OTLoginTextField()
        view.addSubview(pwdTF)
        pwdTF.isSecureTextEntry = true
        pwdTF.placeholder = "密码"
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
        loginBtn.didFinishAutoLayoutBlock = { (frame: CGRect) -> () in
            loginBtn.gradientLayerHorizontal("FF7F58".toUIColor(), "FDA21E".toUIColor())
        };
        
        let termsLbl = UILabel()
        view.addSubview(termsLbl)
        termsLbl.numberOfLines = NSIntegerMax
        termsLbl.font = UIFont.systemFont(ofSize: 13)
        let str = "登录代表您已同意 用户注册及APP使用协议 和 用户使用协议(方案)"
        let textArr = ["用户注册及APP使用协议", "用户使用协议(方案)"]
        
        _ = [termsLbl .yb_addAttributeTapAction(with: textArr, delegate: self)]
        _ = termsLbl.sd_layout().leftEqualToView(loginBtn)?.rightEqualToView(loginBtn)?.topSpaceToView(loginBtn, 15)?.maxHeightIs(35)
        
        let nStr: NSString = str as NSString
        
        let range1 = nStr.range(of: textArr[0])
        let range2 = nStr.range(of: textArr[1])
        
        let attr = NSMutableAttributedString.init(string: str)
//        let number = NSNumber(value: NSUnderlineStyle.RawValue)
        
        attr.addAttributes([NSAttributedStringKey.foregroundColor: "376bfb".toUIColor(),
                            kCTUnderlineStyleAttributeName as NSAttributedStringKey: 1], range:range1)
        attr.addAttributes([NSAttributedStringKey.foregroundColor: "376bfb".toUIColor(),
                            kCTUnderlineStyleAttributeName as NSAttributedStringKey: 1], range: range2)
        termsLbl.attributedText = attr
        
        
//        let user_email = OTUtils.OTObject(OTPersistence.user_email)
//        let user_pwd = OTUtils.OTObject(OTPersistence.user_pwd)
//        let test = OTUtils.OTObject("hahah")

        
        nameTF.text = OTUtils.OTObject(OTPersistence.user_email)
        pwdTF.text = OTUtils.OTObject(OTPersistence.user_pwd)
//        OTUtils.LogOut("\(user_email), + \(user_pwd)")
        
        
        
        
        
    }
    
    //  MARK: - events
    @objc func tapClick(_ tap:UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func loginClick(_ button: UIButton) {
        
        if (nameTF.text?.count)! < 0 {
            OTUtils.LogOut("请输入用户名")
            return
        }
        if (pwdTF.text?.count)! < 0 {
            OTUtils.LogOut("请输入密码")
            return
        }
        
        let salt = "em.W_-6q4Zc@a27n9B.comKVCAu.8FS@dE"
        let saltPwd = pwdTF.text! + salt
        let encoder = SHAEncoder()
        let encodedPass = encoder.getSha256String(encoder.getSha256String(saltPwd))
//        OTUtils.LogOut(encodedPass)
        
        let params = ["email": nameTF.text!, "passWord": encodedPass]
        HttpHelper.Shared.Post(path: "/public/login", params: params as! Dictionary<String, String>, success: { (res) in
            OTUtils.LogOut(res)
            
            let result = OTBaseModel(JSONString: res)
            OTCenter.shared.token = result?.data as? String
            if (result?.success)! {
                DispatchQueue.main.async {
                    OTUtils.OTSetObject(self.nameTF.text!, OTPersistence.user_email)
                    OTUtils.OTSetObject(self.pwdTF.text!, OTPersistence.user_pwd)                    
                }
            }
        
        }) { (error) in
            OTUtils.LogOut(error)
        }
    }
    
    func yb_attributeTapReturn(_ string: String!, range: NSRange, index: Int) {
        OTUtils.LogOut("\(string), \(index)")
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
