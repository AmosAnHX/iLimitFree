//
//  CustomtabBarViewController.swift
//  HomeWork
//
//  Created by qianfeng on 16/8/29.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit


//标签栏视图控制器 tabBar
class CustomtabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
                
        
        //设置标签
        
        
        //限免
        //先创建一个标签
        let vc1 = ViewController1()
        //加到导航控制器
        let nvc1 = UINavigationController(rootViewController: vc1)
        
        //设置navigationBar的背景色
        var bgImage1 = UIImage(named: "navigationbar")
        //填充满navigationbar的背景
        bgImage1 = bgImage1?.stretchableImageWithLeftCapWidth(10, topCapHeight: 10)
        //在导航控制器中显示出来
        nvc1.navigationBar.setBackgroundImage(bgImage1!, forBarMetrics: .Default)

        //配置标签属性
        vc1.navigationItem.title = "限 免"
        vc1.tabBarItem.title = "限免"
        vc1.tabBarItem = UITabBarItem(title: "限免", image: UIImage(named: "tabbar_limitfree"), selectedImage: UIImage(named: "tabbar_limitfree_press"))
        
        
        
        //降价
        let vc2 = ViewController2()
        let nvc2 = UINavigationController(rootViewController: vc2)
        
        //设置navigationBar的背景色
        var bgImage2 = UIImage(named: "navigationbar")
        bgImage2 = bgImage2?.stretchableImageWithLeftCapWidth(10, topCapHeight: 10)
        nvc2.navigationBar.setBackgroundImage(bgImage2!, forBarMetrics: .Default)
        
        vc2.navigationItem.title = "降 价"
        vc2.tabBarItem.title = "降价"
        vc2.tabBarItem = UITabBarItem(title: "降价", image: UIImage(named: "tabbar_reduceprice"), selectedImage: UIImage(named: "tabbar_reduceprice_press"))
        
        
        //免费
        let vc3 = ViewController3()
        let nvc3 = UINavigationController(rootViewController: vc3)
        
        //设置navigationBar的背景色
        var bgImage3 = UIImage(named: "navigationbar")
        bgImage3 = bgImage3?.stretchableImageWithLeftCapWidth(10, topCapHeight: 10)
        nvc3.navigationBar.setBackgroundImage(bgImage3!, forBarMetrics: .Default)
        
        vc3.navigationItem.title = "免 费"
        vc3.tabBarItem.title = "免费"
        vc3.tabBarItem = UITabBarItem(title: "免费", image: UIImage(named: "tabbar_appfree"), selectedImage: UIImage(named: "tabbar_appfree_press"))
        
        
        //专题
        let vc4 = ViewController4()
        let nvc4 = UINavigationController(rootViewController: vc4)
        
        //设置navigationBar的背景色
        var bgImage4 = UIImage(named: "navigationbar")
        bgImage4 = bgImage4?.stretchableImageWithLeftCapWidth(10, topCapHeight: 10)
        nvc4.navigationBar.setBackgroundImage(bgImage4!, forBarMetrics: .Default)
        
        vc4.navigationItem.title = "专 题"
        vc4.tabBarItem.title = "专题"
        vc4.tabBarItem = UITabBarItem(title: "专题", image: UIImage(named: "tabbar_subject"), selectedImage: UIImage(named: "tabbar_subject_press"))
        
        //热榜
        let vc5 = ViewController5()
        let nvc5 = UINavigationController(rootViewController: vc5)
        
        //设置navigationBar的背景色
        var bgImage5 = UIImage(named: "navigationbar")
        bgImage5 = bgImage5?.stretchableImageWithLeftCapWidth(10, topCapHeight: 10)
        nvc5.navigationBar.setBackgroundImage(bgImage5!, forBarMetrics: .Default)
        
        vc5.navigationItem.title = "热 榜"
        vc5.tabBarItem.title = "热榜"
        vc5.tabBarItem = UITabBarItem(title: "热榜", image: UIImage(named: "tabbar_rank"), selectedImage: UIImage(named: "tabbar_rank_press"))
        
        
        //视图控制器的数组
        let viewControllers = [nvc1,nvc2,nvc3,nvc4,nvc5]
        self.viewControllers = viewControllers
       
        
        //设置标签栏的背景色
        self.tabBar.barTintColor = UIColor.blackColor()
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
