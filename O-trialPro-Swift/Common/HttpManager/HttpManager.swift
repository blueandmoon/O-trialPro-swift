//
//  HttpManager.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/11.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit

//typealias ClosureType = (String, String) -> Void

class HttpManager: NSObject {

}

struct Beer: Codable {
    let success: String
    let data: String
    
    
}

public class HttpHelper {
    
    
    //  单例
    public static var Shared = HttpHelper()
    
    //  MARK:   - GET
    func Get(path: String, success: @escaping ((_ result: String) -> ()), failure: @escaping ((_ error: Error) ->())) {
        
        let path = HttpHelper().checkPathHeader(path)
        
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
    
    //  MARK:   -   POST
    func Post(path: String, params: Dictionary<String, String>, success: @escaping ((_ result: String) -> ()), failure: @escaping ((_ error: Error) -> ())) {
        
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
            //UTF8转码，防止汉字符号引起的非法网址
            let paraData = paramStr.data(using: .utf8)
            //设置请求体
            request.httpBody = paraData
        }
        
        request.setValue("zh-CN,zh", forHTTPHeaderField: "Accept-Language")
        request .setValue(OTCenter.shared.token, forHTTPHeaderField: "Token")
        request.timeoutInterval = 10
        
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
    
    
    
//    // MARK:- post
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
    
    
    private func checkPathHeader(_ path: String) -> String {
        var path = path
        if !path.hasPrefix("http") {
            path = OTNet.base_Url + path
        }
        return path
    }
    
    
}




