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
        
    }
    
    func configUI() {
        
        let logoIV = UIImageView.init(image: UIImage(named: "my_login_logo"))
        view.addSubview(logoIV)
        let logo = UIImage(named: "my_login_logo")
        _ = logoIV.sd_layout().centerXEqualToView(view)?.topSpaceToView(view, (logo?.size.height)!)?.widthIs((logo?.size.width)!)?.heightIs(120)
        
        nameTF = UITextField();
        view.addSubview(nameTF)
        nameTF.placeholder = "         用户名"
        nameTF.font = UIFont.systemFont(ofSize: 17);
        nameTF.layer.borderWidth = 1
        nameTF.layer.borderColor = UIColor.init(hexString: "dddddd").cgColor
        let leftIV = UIImageView(image: UIImage(named: "my_login_user"))
        leftIV.frame = CGRect.init(x: 20, y: 0, width: 55, height: 25)
        leftIV.layer.borderWidth = 1.0;
        leftIV.contentMode = UIViewContentMode.right
        nameTF.leftViewMode = UITextFieldViewMode.always
        nameTF.leftView = leftIV
        nameTF.sd_cornerRadiusFromHeightRatio = 0.5
        _ = nameTF.sd_layout().centerXEqualToView(view)?.topSpaceToView(logoIV, 80)?.widthIs(view.bounds.size.width - 30)?.heightIs(45)
        
        let img = UIImage(named: "my_login_user")
        let w = (img?.size.width)! + leftIV.frame.origin.x
        
        nameTF.setValue(NSNumber(value: Float(w)), forKey: "paddingLeft")

        
        
        
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
