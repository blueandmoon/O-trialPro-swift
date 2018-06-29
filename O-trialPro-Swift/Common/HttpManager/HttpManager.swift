//
//  HttpManager.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/11.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit
import HandyJSON
import Alamofire

//typealias ClosureType = (String, String) -> Void

class HttpManager: NSObject {

}


public class HttpHelper {
    
    
    //  单例
    public static var Shared = HttpHelper()
    
    //  MARK:   - GET
    func Get(path: String, params: Dictionary<String, Any>?, success: @escaping ((_ result: String?, _ mes: String?) -> ()), failure: @escaping ((_ error: Error) ->())) {
        
        let path = HttpHelper().checkPathHeader(path)
        
        
        let url = URL(string: path.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
        var request = URLRequest.init(url: url!)
        request.setValue("zh-CN,zh", forHTTPHeaderField: "Accept-Language")
        request.setValue(OTCenter.shared.token, forHTTPHeaderField: "Token")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 10
        
        if let params = params {
            for (key, value) in params {
                request.setValue(value as? String, forHTTPHeaderField: key)
            }
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { (data, respond, error) in
            UIView.stopLoading()
            if let data = data {
                if let res = String(data: data, encoding: .utf8) {
                    let obj = try! JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! Dictionary<String, Any>
                    success(res, obj["errorMessage"] as? String)
                }
            } else {
                failure(error!)
            }
        }
        dataTask.resume()
    }
    
    //  MARK:   -   POST
    func Post(path: String, params: Dictionary<String, String>, success: @escaping ((_ result: String?, _ mes: String?) -> ()), failure: @escaping ((_ error: Error) -> ())) {
        
        let path = HttpHelper().checkPathHeader(path)
        let url = URL(string: path)
        var request = URLRequest.init(url: url!)
        let list  = NSMutableArray()
        if params.count > 0 {
            //设置为POST请求
            request.httpMethod = "POST"
            //拆分字典,subDic是其中一项，将key与value变成字符串
            for subDic in params {
                let tmpStr = "\(subDic.0)=\(subDic.1)"
                list.add(tmpStr)
            }
            //用&拼接变成字符串的字典各项
            let paramStr = list.componentsJoined(by: "&")
//            OTUtils.LogOut(String(format: "%@", paramStr))
            //UTF8转码，防止汉字符号引起的非法网址
            let paraData = paramStr.data(using: .utf8)
            //设置请求体
            request.httpBody = paraData
        }
        
        request.setValue("zh-CN,zh", forHTTPHeaderField: "Accept-Language")
        request.setValue(OTCenter.shared.token, forHTTPHeaderField: "Token")
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")  //  设置了不太对, 登录不了了
        request.timeoutInterval = 10
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let dataTask = session.dataTask(with: request) { (data, respond, error) in
            UIView.stopLoading()
            if let data = data {
                if let res = String(data: data, encoding: .utf8) {
                    let obj = try! JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! Dictionary<String, Any>
                    success(res, obj["errorMessage"] as? String)
                }
            } else {
                failure(error!)
            }
            
            
        }
        dataTask.resume()
    }
    //  18506283965
    //  MARK:   -   POST
    func Put(path: String, params: Dictionary<String, String>, success: @escaping ((_ result: String?, _ mes: String?) -> ()), failure: @escaping ((_ error: Error) -> ())) {
        
        var path = HttpHelper().checkPathHeader(path)
        
        let list  = NSMutableArray()
        if params.count > 0 {
            //拆分字典,subDic是其中一项，将key与value变成字符串
            for subDic in params {
                let tmpStr = "\(subDic.0)=\(subDic.1)"
                list.add(tmpStr)
            }
            //用&拼接变成字符串的字典各项
            let paramStr = list.componentsJoined(by: "&")
            //            OTUtils.LogOut(String(format: "%@", paramStr))
            path = String(format: "%@?%@", path, paramStr)
        }
        let url = URL(string: path)
        var request = URLRequest.init(url: url!)
        
        request.httpMethod = "PUT"
        request.setValue("zh-CN,zh", forHTTPHeaderField: "Accept-Language")
        request.setValue(OTCenter.shared.token, forHTTPHeaderField: "Token")
        request.timeoutInterval = 10
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let dataTask = session.dataTask(with: request) { (data, respond, error) in
            UIView.stopLoading()
            if let data = data {
                if let res = String(data: data, encoding: .utf8) {
                    let obj = try! JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! Dictionary<String, Any>
                    success(res, obj["errorMessage"] as? String)
                }
            } else {
                failure(error!)
            }
            
            
        }
        dataTask.resume()
        
//        Alamofire.request(path, method: .put, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
//            debugPrint(response)
//        }
//        Alamofire.request(path, method: .put, parameters: params, encoding: JSONEncoding.default)
//            .responseJSON { response in
//                debugPrint(response)
//
//        }

    }
    
    
    private func checkPathHeader(_ path: String) -> String {
        var path = path
        if !path.hasPrefix("http") {
            path = base_Url + path
        }
        return path
    }
    
    
}




