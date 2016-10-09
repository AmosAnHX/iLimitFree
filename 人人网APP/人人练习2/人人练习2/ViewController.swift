//
//  ViewController.swift
//  人人练习2
//
//  Created by qianfeng on 16/9/2.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //创建一个背景图片,作为所有页面视图的主背景
        let bgImageView = UIImageView()
        bgImageView.frame = UIScreen.mainScreen().bounds
        bgImageView.image = UIImage(named: "rr_main_background@2x")
        bgImageView.userInteractionEnabled = true
        self.view.addSubview(bgImageView)
        
        //打印出程序执行时缓存的途径
        print(NSHomeDirectory())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

