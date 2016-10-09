//
//  ViewController.swift
//  人人练习3
//
//  Created by qianfeng on 16/9/3.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //背景
        let bgImageView = UIImageView()
        bgImageView.frame = UIScreen.mainScreen().bounds
        bgImageView.image = UIImage(named: "rr_main_background")
        bgImageView.userInteractionEnabled = true
        self.view.addSubview(bgImageView)
        
        
        print(NSHomeDirectory())
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

