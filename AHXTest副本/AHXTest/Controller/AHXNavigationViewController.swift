//
//  AHXNavigationViewController.swift
//  AHXTest
//
//  Created by qianfeng on 16/9/30.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

/*
 导航类
 */
class AHXNavigationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.whiteColor()
        
        //navigationbar的背景图片
        self.navigationController?.navigationBar.frame = CGRectMake(0, 0, view.bounds.size.width, 64)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named:"top-bg"), forBarMetrics: .Default)
    }
    //标题文字
    func addNaviTitle(title: String){
        
        let label = UILabel.createLabel(CGRectMake(80, 20, 215, 44), title: title, textAlignment: .Center)
        label.font = UIFont.boldSystemFontOfSize(25)
        label.textColor = UIColor.whiteColor()
        navigationItem.titleView = label
        
        
    }
    //导航按钮
    func addNaviButton(title: String,target: AnyObject?,action: Selector,isLeft: Bool)->UIButton{
        
        let button = addNaviButton(title, target: target, action:action, isLeft: isLeft, imageName: "navButton")
        return button
    }
    
    private func addNaviButton(title: String,target: AnyObject?,action: Selector,isLeft: Bool, imageName: String ) -> UIButton{
        let button = UIButton.createButton(CGRectMake(0, 0, 60, 36), title: title, bgImageName: imageName , target: target, action: action)
        let barButton = UIBarButtonItem(customView: button)
        if isLeft{
            //左边
            navigationItem.leftBarButtonItem = barButton
        }else {
            //右边
            navigationItem.rightBarButtonItem = barButton
        }
        return button
    }
    
    //添加返回按钮
    func addBackButton(){
        
        addNaviButton("返回", target: self, action: #selector(backAction), isLeft: true, imageName: "backButton")
        
    }
    func backAction(){
        
        navigationController?.popViewControllerAnimated(true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
