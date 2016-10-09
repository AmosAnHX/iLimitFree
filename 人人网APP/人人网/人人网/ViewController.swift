//
//  ViewController.swift
//  人人网
//
//  Created by qianfeng on 16/8/31.
//  Copyright © 2016年 Amos. All rights reserved.
//


import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //创建一个背景图片
        let bgImageView = UIImageView()
        bgImageView.frame = UIScreen.mainScreen().bounds
        bgImageView.image = UIImage(named: "rr_main_background")
        bgImageView.userInteractionEnabled = true
        self.view.addSubview(bgImageView)
        
        
        //找到本地存储文件   !!!!!!
        print(NSHomeDirectory())
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

