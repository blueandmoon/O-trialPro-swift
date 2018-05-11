//
//  HttpManager.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/11.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit

class HttpManager: NSObject {

}

public class HttpHelper {
    
    //  单例
    public static var Shared = HttpHelper()
    
    /// MARK:   - GET请求
    
    func Get(path: String, success: @escaping ((_ result: String) -> ()), failure: @escaping ((_ error: Error) ->())) {
        let url = URL(string: path.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, respond, error) in
            if let data = data {
                if let result = String(data: data, encoding: .utf8) {
                    success(result)
                }
            } else {
                failure(error!)
            }
        }
        dataTask.resume()
    
    }
    
    //  MARK:   -   POST请求
    func Post(path: String, params: Dictionary<String, String>, success: @escaping ((_ result: String) -> ()), failure: @escaping ((_ error: Error) -> ())) {
        
        let url = URL(string: path)
        var request = URLRequest.init(url: url!)
//        request.httpMethod = "post"
//        request.httpBody = params.data(using: .utf8)
        
//        var params = [String: String]()
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
            //UTF8转码，防止汉字符号引起的非法网址
            let paraData = paramStr.data(using: .utf8)
            //设置请求体
            request.httpBody = paraData
        }
        
        
//        request.setValue("zh-CN,zh", forHTTPHeaderField: "Accept-Language")
//        request .setValue(OTCenter.shared.token, forHTTPHeaderField: "Token")
//        request.cachePolicy = URLRequest.CachePolicy.
        
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let dataTask = session.dataTask(with: request) { (data, respond, error) in
            if let data = data {
                if let result = String(data: data, encoding: .utf8) {
                    success(result)
                }
            } else {
                failure(error!)
            }
        }
        dataTask.resume()
    }
    
    
    
//    // MARK:- post请求
//    func Post(path: String,paras: String,success: @escaping ((_ result: String) -> ()),failure: @escaping ((_ error: Error) -> ())) {
//
//        let url = URL(string: path)
//        var request = URLRequest.init(url: url!)
//        request.httpMethod = "POST"
//
//        request.httpBody = paras.data(using: .utf8)
//
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: request) { (data, respond, error) in
//
//            if let data = data {
//
//                if let result = String(data:data,encoding:.utf8){
//                    success(result)
//                }
//
//            }else {
//                failure(error!)
//            }
//        }
//        dataTask.resume()
//    }
    
    
}




