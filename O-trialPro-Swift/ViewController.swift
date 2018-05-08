//
//  ViewController.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/7.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let v = UIView.init(frame: CGRect(x: 100, y: 100, width: 100, height: 30));
        view.addSubview(v);
        v.backgroundColor = UIColor.purple;
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

