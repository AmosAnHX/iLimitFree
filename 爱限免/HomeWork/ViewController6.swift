//
//  ViewController6.swift
//  HomeWork
//
//  Created by qianfeng on 16/8/29.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class ViewController6: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //左按钮  返回
        let leftButton = UIButton(type: .Custom)   //Custom 渲染效果
        leftButton.frame = CGRectMake(0, 0, 50, 30)
        leftButton.setBackgroundImage(UIImage(named: "buttonbar_back"), forState: .Normal)
        leftButton.setTitle("返回", forState: .Normal)
        leftButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        leftButton.tintColor = UIColor.blackColor()
        leftButton.addTarget(self, action: "backAction", forControlEvents: .TouchUpInside)
        let leftItem = UIBarButtonItem(customView: leftButton)
        self.navigationItem.leftBarButtonItem = leftItem
        
        //取消设置按钮
        let rightItem = UIBarButtonItem()
        self.navigationItem.rightBarButtonItem = rightItem

    }
    func backAction(){
        self.navigationController?.popToRootViewControllerAnimated(true)
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
