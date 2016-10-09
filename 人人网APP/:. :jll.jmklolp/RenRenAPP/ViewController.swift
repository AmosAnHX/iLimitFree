//
//  ViewController.swift
//  RenRenAPP
//
//  Created by KG on 16/8/31.
//  Copyright © 2016年 KG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //创建一个背景图片
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

