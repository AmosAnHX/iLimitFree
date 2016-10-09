//
//  ViewController.swift
//  AutoTank
//
//  Created by qianfeng on 16/8/25.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //创建一个坦克
        let tank = Tank()
        self.view.addSubview(tank)
        
        
        
        //创建一个方向盘
        let direcdtionCtl = DirectionControl()
        //加到屏幕上
        self.view.addSubview(direcdtionCtl)
        
        
        //建立坦克与方向盘的关系
        direcdtionCtl.target = tank
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

