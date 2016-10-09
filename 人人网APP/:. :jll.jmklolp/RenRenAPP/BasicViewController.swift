//
//  BasicViewController.swift
//  RenRenAPP
//
//  Created by KG on 16/9/1.
//  Copyright © 2016年 KG. All rights reserved.
//

import UIKit

class BasicViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //这个类，做为所面所有类的父类，用来去封装导航条上的内容
        
        //做一张图片
//        let navBGImage = UIImage(named: "header_bg")?.stretchableImageWithLeftCapWidth(10, topCapHeight: 10)
//        //设置到导航条上去
//        self.navigationController?.navigationBar.setBackgroundImage(navBGImage, forBarMetrics: .Default)
        
        self.navigationController?.navigationBar.barTintColor = UIColor.cyanColor()
        
        
        //titleView
        let titleView = UIImageView()
        titleView.frame = CGRectMake(0, 0, 60, 35)
        titleView.image = UIImage(named: "logo_title")
        self.navigationItem.titleView = titleView
        
        
        
        
        //左按钮
        let leftItem = UIBarButtonItem(image: UIImage(named: "main_left_nav")?.imageWithRenderingMode(.AlwaysOriginal), style: .Plain, target: self, action: "leftItemAction")
        
        self.navigationItem.leftBarButtonItem = leftItem
        
        //右按钮
        let rightItem = UIBarButtonItem(image:UIImage(named: "main_right_nav")?.imageWithRenderingMode(.AlwaysOriginal), style: .Plain, target: self, action: "rightItemAction")
        self.navigationItem.rightBarButtonItem = rightItem
    
    }
    //左按钮的响应方法
    func leftItemAction(){
        
        //左按钮功能 是用来返回上一页面
        //这些页面都是在登陆后，使用nvc，push出来的，所以要pop回去
        self.navigationController?.popViewControllerAnimated(true)
    }
    //右按钮的响应方法
    func rightItemAction(){
        //因为右按钮的功能 是退出，返回到登陆界面上去
        //登陆是界面是没有导航条的，所以说，他应该是由登陆界面present出来的
        //退出应该dismiss
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
