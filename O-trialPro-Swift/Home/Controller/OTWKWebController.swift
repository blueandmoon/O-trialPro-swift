//
//  OTWKWebController.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/16.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit
import WebKit

class OTWKWebController: BaseViewController, WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler, UIScrollViewDelegate {
    
    
    lazy var webV: WKWebView = {
        
        let config = WKWebViewConfiguration()
//        config.requiresUserActionForMediaPlayback = false
        config.allowsInlineMediaPlayback = true
        
        let userContent = WKUserContentController()
        userContent.add(self, name: "jsMessage")
        config.userContentController = userContent
        
        let web = WKWebView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight), configuration: config)
        self.view.addSubview(web)
        web.uiDelegate = self
        web.navigationDelegate = self
        web.scrollView.delegate = self
        
        return web
    }()
    
    var url: URL!
    
    
    init(_ url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addBackItem()
        self.navigationController?.navigationBar.isHidden = false
        
        view.addSubview(webV)
        if self.url != nil {
            var request = URLRequest(url: self.url)
            request.setValue(OTCenter.shared.token, forHTTPHeaderField: "token")
            self.webV.load(request)
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
    }
    
    
    func addJavaScript() {
        webV.evaluateJavaScript("document.title") { (obj, error) in
            var title = obj as! String
            if title.count > 10 {
                let ind = title.index(title.startIndex, offsetBy: 9)
                title = String(title[..<ind])
            }
//            if title == "意见反馈" {
//                self.title = title
//            } el
            self.title = title
            
        }
    }
    
    //  MARK:   - WKScriptMessageHandler
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        LogOut("js传来的消息: \(message)")
    }
    
    //  MARK:   - WKWebViewDelegate
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        LogOut(error)
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.addJavaScript()
    }
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let alert = UIAlertController.init(title: "提示", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "确认", style: .default, handler: { (action) in
            completionHandler()
        }));
        self.present(alert, animated: true, completion: nil)
    }
    
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        let alert = UIAlertController.init(title: "提示", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: { (action) in
            completionHandler(false)
        }));
        alert.addAction(UIAlertAction(title: "确认", style: .default, handler: { (action) in
            completionHandler(true)
        }));
        self.present(alert, animated: true, completion: nil)
    }
    
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        let alert = UIAlertController.init(title: prompt, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "完成", style: .default, handler: { (action) in
            if alert.textFields![0].text != nil {
                completionHandler(alert.textFields![0].text)
            } else {
                completionHandler("")
            }
        }));
        self.present(alert, animated: true, completion: nil)
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        //  好像不用写了
    }
    
    //  发送request后, 收到响应后调用
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        let doc = "document.body.outerHTML"
        webView.evaluateJavaScript(doc) { (htmlStr, error) in
            if error != nil {
                LogOut(error ?? "")
            }
            LogOut(htmlStr ?? "")
        }
        LogOut("\(String(describing: webView.url))")
        decisionHandler(WKNavigationResponsePolicy.allow)
        
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if navigationAction.targetFrame == nil {
            var request = URLRequest(url: URL(string: (navigationAction.request.url?.absoluteString)!)!)
            request.setValue(OTCenter.shared.token, forHTTPHeaderField: "token")
            webView.load(request)
        }
        decisionHandler(WKNavigationActionPolicy.allow)
        
    }
    
    //  MARK:   - scrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let indicator = scrollView.subViewOfClassName("_WKPDFPageNumberIndicator")
        indicator?.isHidden = true
    }
    

}

//extension OTWKWebController {
//    convenience init(_ url: URL) {
//        self.init()
//        self.url = url
//    }
//}
