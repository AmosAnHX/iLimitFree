//
//  AHXTableBarViewController.swift
//  AHXTest
//
//  Created by qianfeng on 16/9/30.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

/*
 标签栏
 */

class AHXTableBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.tintColor = UIColor(red: 83.0/255.0, green: 156.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        //标签栏的背景
        self.tabBar.backgroundImage = UIImage(named: "tabbar_bg")
        
        //创建管理的子视图控制器
        createViewControllers()
        
        
    }
    func createViewControllers(){
        
        //标题
        let titleArray = ["首页","今日限免","分类","推荐","更多"]
        
        //图片
        let imageArray = ["item_app_home","item_app_pricedrop","c-category","item_app_hot","item_app_myapps"]
        
        //视图控制器
        let ctrlArray = ["AHXTest.AHXHomeViewController",
                         "AHXTest.AHXLimitViewController",
                         "AHXTest.AHXCategoryViewController",
                         "AHXTest.AHXRecommendViewController",
                         "AHXTest.AHXMoreItemViewController"]
        //数组
        var array = Array<UINavigationController>()
        for i in 0..<titleArray.count {
            //1)创建视图控制器
            let ctrlName = ctrlArray[i]
            let ctrls = NSClassFromString(ctrlName) as! UIViewController.Type
            let ctrl = ctrls.init()
            
            //2)设置文字和图片
            //标题文字
            ctrl.tabBarItem.title = titleArray[i]
            let imageName = imageArray[i]
            //图片
            ctrl.tabBarItem.image = UIImage(named: imageName)
            //选中图片
            ctrl.tabBarItem.selectedImage = UIImage(named:"tab_s")
            
            //3)导航
            let naviCtrl = UINavigationController(rootViewController: ctrl)
            array.append(naviCtrl)
            
        }
        viewControllers = array
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
