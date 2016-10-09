//
//  ViewController.swift
//  打地鼠
//
//  Created by qianfeng on 16/8/29.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //设置背景
        var bg1ImageView = UIImageView()
        bg1ImageView.frame = CGRectMake(0, 40, 320, 227)
        let image1 = UIImage(named: "GameBG01")
        bg1ImageView = UIImageView(image: image1)
        
        self.view.addSubview(bg1ImageView)
    
        var bg2ImageView = UIImageView()
        bg2ImageView.frame = CGRectMake(0, 297, 320, 124)
        let image2 = UIImage(named: "GameBG02")
        bg2ImageView = UIImageView(image: image2)
        
        self.view.addSubview(bg2ImageView)
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

