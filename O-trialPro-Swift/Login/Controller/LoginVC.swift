//
//  LoginVC.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/7.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit

class LoginVC: UIViewController, UITextFieldDelegate {

    var nameTF : UITextField!
    var pwdTF : UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white;
        UIApplication.shared.isStatusBarHidden = true
        
        configUI();
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(self.tapClick(_:)))
        view.addGestureRecognizer(tap)
        
    }
    
    //  MARK: - views
    
    func configUI() {
        
        let logo = UIImage(named: "my_login_logo")
        let logoIV = UIImageView(image: logo)
        view.addSubview(logoIV)
        _ = logoIV.sd_layout().centerXEqualToView(view)?.topSpaceToView(view, (logo?.size.height)!)?.widthIs((logo?.size.width)!)?.heightIs(120)
        
        
        
        nameTF = UITextField()
        view.addSubview(nameTF)
        nameTF.placeholder = "         用户名"
        nameTF.font = UIFont.systemFont(ofSize: 17);
        nameTF.layer.borderWidth = 1
        nameTF.layer.borderColor = UIColor.init(hexString: "dddddd").cgColor
        let leftIV = UIImageView(image: UIImage(named: "my_login_user"))
        leftIV.frame = CGRect.init(x: 20, y: 0, width: 55, height: 25)
//        leftIV.layer.borderWidth = 1.0;
        leftIV.contentMode = UIViewContentMode.right
        nameTF.leftViewMode = UITextFieldViewMode.always
        nameTF.leftView = leftIV
        nameTF.sd_cornerRadiusFromHeightRatio = 0.5
        _ = nameTF.sd_layout().centerXEqualToView(view)?.topSpaceToView(logoIV, 80)?.widthIs(view.bounds.size.width - 30)?.heightIs(45)
        
        let img = UIImage(named: "my_login_user")
        let w = (img?.size.width)! + leftIV.frame.origin.x
        nameTF.setValue(NSNumber(value: Float(w)), forKey: "paddingLeft")
        
        
        pwdTF = UITextField()
        view.addSubview(pwdTF)
        pwdTF.placeholder = "         密码"
        pwdTF.font = UIFont.systemFont(ofSize: 17);
        pwdTF.layer.borderWidth = 1
        pwdTF.layer.borderColor = UIColor.init(hexString: "dddddd").cgColor
        let leftIV1 = UIImageView(image: UIImage(named: "my_login_user"))
        leftIV1.frame = CGRect.init(x: 20, y: 0, width: 55, height: 25)
//        leftIV1.layer.borderWidth = 1.0;
        leftIV1.contentMode = UIViewContentMode.right
        pwdTF.leftViewMode = UITextFieldViewMode.always
        pwdTF.leftView = leftIV1
        pwdTF.sd_cornerRadiusFromHeightRatio = 0.5
        _ = pwdTF.sd_layout().centerXEqualToView(view)?.topSpaceToView(nameTF, 15)?.widthIs(view.bounds.size.width - 30)?.heightIs(45)
        
        let img1 = leftIV1.image
        let w1 = (img1?.size.width)! + leftIV1.frame.origin.x
        pwdTF.setValue(NSNumber(value: Float(w1)), forKey: "paddingLeft")
        
        let loginBtn = UIButton(type: UIButtonType.custom)
        view.addSubview(loginBtn)
        loginBtn.setTitle("登录", for: .normal)
        loginBtn.sd_cornerRadiusFromHeightRatio = 0.5
        loginBtn.backgroundColor = UIColor(hexString: "f8f8f8")
        loginBtn.setTitleColor(UIColor(hexString: "ffffff"), for: .normal)
        _ = loginBtn.sd_layout().leftEqualToView(nameTF)?.rightEqualToView(nameTF)?.topSpaceToView(pwdTF, 15)?.heightRatioToView(pwdTF, 1.0)
        loginBtn.addTarget(self, action: #selector(self.loginClick(_:)), for: .touchUpInside)
//        let z = "FFC0CB".toUIColor()
        loginBtn.didFinishAutoLayoutBlock = { (frame: CGRect) -> () in
            loginBtn.gradientLayerHorizontal("FF7F58".toUIColor(), "FDA21E".toUIColor())
        };
        
//            (CGRect, free); do {
//            loginBtn.gradientLayerHorizontal(.black, .red)
//        };
        
        
        
    }
    
    //  MARK: - events
    @objc func tapClick(_ tap:UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func loginClick(_ button: UIButton) {
        
        print("login...")
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
