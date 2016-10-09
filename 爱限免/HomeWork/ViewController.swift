//
//  ViewController.swift
//  HomeWork
//
//  Created by qianfeng on 16/8/29.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let colors = [UIColor.redColor(),UIColor.orangeColor(),UIColor.yellowColor(),UIColor.greenColor(),UIColor.cyanColor(),UIColor.blueColor(),UIColor.purpleColor()]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //随机产生背景颜色
        let index = arc4random_uniform(UInt32(colors.count))
        let color = colors[Int(index)]
        self.view.backgroundColor = color

        
        
        //左按钮 分类
        let leftButton = UIButton(type: .Custom)   //渲染效果
        leftButton.frame = CGRectMake(0, 0, 50, 30)
        //设置leftButton背景,同时显示image和文字
        leftButton.setBackgroundImage(UIImage(named: "buttonbar_action"), forState: .Normal)
        leftButton.setTitle("分类", forState: .Normal)
        //设置button标题的字体颜色
        leftButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        leftButton.addTarget(self, action: "leftButtonAction", forControlEvents: .TouchUpInside)
        let leftItem = UIBarButtonItem(customView: leftButton)
        self.navigationItem.leftBarButtonItem = leftItem
        
        
        //右按钮  设置
        let rightButton = UIButton(type: .Custom)
        rightButton.frame = CGRectMake(350, 0, 50, 30)
        rightButton.setBackgroundImage(UIImage(named: "buttonbar_action"), forState: .Normal)
        rightButton.setTitle("设置", forState: .Normal)
        rightButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        rightButton.addTarget(self, action: "rightButtonAction", forControlEvents: .TouchUpInside)
        let rightItem = UIBarButtonItem(customView: rightButton)
        self.navigationItem.rightBarButtonItem = rightItem

        
        
        
    }
    
    func leftButtonAction(){
        print("点击了分类")
    }
    func rightButtonAction(){
        print("点击了设置")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

