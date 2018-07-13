//
//  ModifyPwdVC.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/6/21.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit
import HandyJSON

class ModifyPwdVC: BaseViewController {

    var pwdTF: UITextField?
    var newPwdTf: UITextField?
    var confirmTf: UITextField?
    var modifyBtn: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "修改密码"
        
        configUI()
        
        
    }
    
    override func configUI() {
        
        pwdTF = UITextField()
        view.addSubview(pwdTF!)
        pwdTF?.font = UIFont.systemFont(ofSize: 16)
        pwdTF?.placeholder = "  请输入原始密码"
        pwdTF?.isSecureTextEntry = true
        pwdTF?.layer.borderWidth = 1
        pwdTF?.setValue(NSNumber(value: 10), forKeyPath: "paddingLeft")
        pwdTF?.layer.cornerRadius = 5
        pwdTF?.clipsToBounds = true
        pwdTF?.layer.borderColor = HexColor(OT_Light_Yellow).cgColor
        _ = pwdTF?.sd_layout().leftSpaceToView(view, 15)?.rightSpaceToView(view, 15)?.topSpaceToView(view, 20)?.heightIs(40)
        
        newPwdTf = UITextField()
        view.addSubview(newPwdTf!)
        newPwdTf?.font = UIFont.systemFont(ofSize: 16)
        newPwdTf?.placeholder = "  请输入新密码"
        newPwdTf?.isSecureTextEntry = true
        newPwdTf?.layer.borderWidth = 1
        newPwdTf?.setValue(NSNumber(value: 10), forKeyPath: "paddingLeft")
        newPwdTf?.layer.cornerRadius = 5
        newPwdTf?.clipsToBounds = true
        newPwdTf?.layer.borderColor = HexColor(OT_Light_Yellow).cgColor
        _ = newPwdTf?.sd_layout().leftEqualToView(pwdTF)?.rightEqualToView(pwdTF)?.heightRatioToView(pwdTF, 1.0)?.topSpaceToView(pwdTF, 15)
        
        confirmTf = UITextField()
        view.addSubview(confirmTf!)
        confirmTf?.font = UIFont.systemFont(ofSize: 16)
        confirmTf?.placeholder = "  请再次输入新密码"
        confirmTf?.isSecureTextEntry = true
        confirmTf?.layer.borderWidth = 1
        confirmTf?.setValue(NSNumber(value: 10), forKeyPath: "paddingLeft")
        confirmTf?.layer.cornerRadius = 5
        confirmTf?.clipsToBounds = true
        confirmTf?.layer.borderColor = HexColor(OT_Light_Yellow).cgColor
        _ = confirmTf?.sd_layout().leftEqualToView(pwdTF)?.rightEqualToView(pwdTF)?.heightRatioToView(pwdTF, 1.0)?.topSpaceToView(newPwdTf, 15)
        
        modifyBtn = UIButton(type: .custom)
        view.addSubview(modifyBtn!)
        modifyBtn?.setTitle("修改", for: .normal)
        modifyBtn?.backgroundColor = HexColor(OT_Light_Yellow)
        modifyBtn?.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        modifyBtn?.layer.cornerRadius = 5
        modifyBtn?.clipsToBounds = true
        _ = modifyBtn?.sd_layout().leftEqualToView(pwdTF)?.rightEqualToView(pwdTF)?.topSpaceToView(confirmTf, 20)?.heightRatioToView(pwdTF, 1.0)
        modifyBtn?.whenTapped {
            if self.pwdTF?.text?.count == 0 {
                UIView.alertText("原始密码不能为空")
                return
            }
            if self.newPwdTf?.text?.count == 0 {
                UIView.alertText("新密码不能为空")
                return
            }
            if self.confirmTf?.text?.count == 0 {
                UIView.alertText("确认新密码不能为空")
                return
            }
            if self.newPwdTf?.text != self.confirmTf?.text {
                UIView.alertText("两次输入的新密码不一致")
                return
            }
            self.sendModifyQuery()
        }
        
        
    }
    
    func sendModifyQuery() {
        
        let param = ["oldPassword": SHAEncoder().getSha256String(SHAEncoder().getSha256String(String(format: "%@%@", (pwdTF?.text)!, OT_Salt))), "newPassword": SHAEncoder().getSha256String(SHAEncoder().getSha256String(String(format: "%@%@", (newPwdTf?.text)!, OT_Salt)))]
        HttpHelper.Shared.Put(path: "/user/password", params: param as! Dictionary<String, String>, success: { (res, mes) in
            if mes != nil {
                UIView.alertText(mes)
                return
            }
            if let model = JSONDeserializer<OTLoginModel>.deserializeFrom(json: res) {
                if model.success! {
                    UIView.alertText("密码修改成功")
                    self.navigationController?.popViewController(animated: true)
                }
            }
            
            
        }) { (error) in
            
        };
        
        
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
