
//
//  BasicViewController.swift
//  人人练习2
//
//  Created by qianfeng on 16/9/2.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class BasicViewController: ViewController {

    @IBOutlet var BasicViewController: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //这个类作为所有类的父类,用来去封装导航条上的内容
        //做一张底片到导航条上
//        let nvcBgImage = UIImage(named: "header_bg")?.stretchableImageWithLeftCapWidth(10, topCapHeight: 10)
//        //设置到导航条
//        self.navigationController?.navigationBar.setBackgroundImage(nvcBgImage, forBarMetrics: .Default)
//        
        self.navigationController?.navigationBar.barTintColor = UIColor.blueColor()
        
        //logoTitle
        let titleView = UIImageView()
        titleView.frame = CGRectMake(0, 0, 60, 35)
        titleView.image = UIImage(named: "logo_title")
        self.navigationItem.titleView = titleView
        
        //左按钮
        let leftItem = UIBarButtonItem(image: UIImage(named: "main_left_nav")?.imageWithRenderingMode(.AlwaysOriginal), style: .Plain, target: self, action: "leftItemItemAction")
        self.navigationItem.leftBarButtonItem = leftItem
        //右按钮
        let rightItem = UIBarButtonItem(image: UIImage(named: "main_right_nav")?.imageWithRenderingMode(.AlwaysOriginal), style: .Plain, target: self, action: "rightItemAction")
        self.navigationItem.rightBarButtonItem = rightItem
        
    }
    //左按钮响应方法
    func leftItemItemAction(){
        //都是push出来的所以要pop回去
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    //右按钮响应方法
    func rightItemAction(){
        //退出登录界面,只能用present,没有加入导航条
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
