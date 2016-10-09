//
//  RRHomeViewController.swift
//  人人网
//
//  Created by qianfeng on 16/8/31.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit


//主页视图

class RRHomeViewController: BasicViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //调用方法,布局自定义按钮
        configCustomButton()
        //调用方法,布局自定义视图
        configCustomView()
        
    }
    //配置按钮
    func configCustomButton(){
        //定义一个数组,装标题
        let titles = ["照片","状态","报道"]
        //图片名数组
        let imageNames = ["rr_pub_takephoto","rr_pub_status","rr_pub_checkin"]
        //响应方法名数组
        let selectors = ["rrPubTakephoto","rrPubStatus","rrPubCheckin"]
        
        //??????自动适配大小吗?
        self.automaticallyAdjustsScrollViewInsets = false
        
        
        
        for i in 0..<titles.count{
            //一个按钮平均138像素
            //9+i*129
            let frame = CGRectMake(CGFloat(15+i*129), 10, 129, 35)
            let title = titles[i]
            let iamge = UIImage(named: imageNames[i])
            //这个方法是将字符串的方法名,转换成一个选择器类型的实例
            let action = NSSelectorFromString(selectors[i])
            
            //创建一个自定义button
            let customButton = CustomButton(frame: frame, image: iamge!, title: title, target: self, action: action)
            //加到屏幕上
            self.view.addSubview(customButton)
        }
       
    }
    //下面三个方法是三个自定义按钮的响应方法
    func rrPubTakephoto(){
        
    }
    func rrPubStatus(){
        
    }
    func rrPubCheckin(){
        
    }
    
    
    //这个方法用来去配置自定义视图
    func configCustomView(){
        //标题数组
        let titles = ["个人主页","新鲜事","好友","应用","位置","相册","搜索","聊天","站内信"]
        let imageNames = ["gerenzhuye","xinxianshi","haoyou","yingyong","weizhifuwu","xiangce","zhaoren","chat","zhanneixin"]
        
        for i in 0..<titles.count{
            
            let x = i/3
            let y = i%3
            let frame = CGRectMake(CGFloat(15+y*129), CGFloat(80+x*180), 129, 140)
            let title = titles[i]
            
            let image = UIImage(named: imageNames[i])
            
            let action:Selector?
            if i == 5{
                //第六个是相册视图的话,那么让他调用下面这个方法
                action = NSSelectorFromString("photoAction")
            }else{
                //其他的视图没有实现功能,所以都调用一个方法
                action = NSSelectorFromString("otherAction")
            }
            //创建视图
            let customView = CustomView(frame: frame, image: image!, title: title, target: self, action: action!)
            self.view.addSubview(customView)
        }
        
    }
    //弹出相册页面
    func photoAction(){
        let photoVc = PhotosViewController()
        self.navigationController?.pushViewController(photoVc, animated: true)
        
    }
    //弹出其他页面
    func otherAction(){
        let otherVC = OtherViewController()
        self.navigationController?.pushViewController(otherVC, animated: true)
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
