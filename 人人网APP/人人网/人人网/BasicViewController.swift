//
//  BasicViewController.swift
//  人人网
//
//  Created by qianfeng on 16/9/1.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

//所有视图的父类


class BasicViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //这个类作为所有类的父类,封装导航条内容
        //做一张图片
        let navBGImage = UIImage(named: "header_bg")?.stretchableImageWithLeftCapWidth(10, topCapHeight: 10)
        //设置到导航条上
        self.navigationController?.navigationBar.setBackgroundImage(navBGImage, forBarMetrics: .Default)
        
        //titleView
        let titleView = UIImageView()
        titleView.frame = CGRectMake(0, 0, 60, 35)
        titleView.image = UIImage(named: "logo_title")
        self.navigationItem.titleView = titleView
        
        
        
        
        
        //左按钮
        let leftItem = UIBarButtonItem(image: UIImage(named: "main_left_nav")?.imageWithRenderingMode(.AlwaysOriginal), style: .Plain, target: self, action: "leftItemAction")
        
        self.navigationItem.leftBarButtonItem = leftItem

        
        //右按钮
        let rightItem = UIBarButtonItem(image: UIImage(named: "main_right_nav")?.imageWithRenderingMode(.AlwaysOriginal), style: .Plain, target: self, action: "rightItemAction")
        
        self.navigationItem.rightBarButtonItem = rightItem
        
    }
    //左按钮功能用来返回上一页,页面都是在登录以后导航控制器push出来的,所以要pop回去
    func leftItemAction(){
        self.navigationController?.popViewControllerAnimated(true)
    }
    //右按钮功能是退出,返回登录界面,登录界面没有导航条的,所以是由导航条presentvc出来的,所以应该dismiss回去
    func rightItemAction(){
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
