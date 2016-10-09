//
//  RRHomeViewController.swift
//  RenRenAPP
//
//  Created by KG on 16/8/31.
//  Copyright © 2016年 KG. All rights reserved.
//

import UIKit

class RRHomeViewController: BasicViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //调用方法，布局自定义按钮
        configCustomButton()
        //调用方法，布局自定义视图
        configCustomView()
    }
    
    //配置按钮
    func configCustomButton(){
    
        //定义一个数组，装标题
        let titles = ["照片","状态","报道"]
        //图片名数组
        let imageNames = ["rr_pub_takephoto","rr_pub_status","rr_pub_checkin"]
        //响应方法名数组
        let selectors = ["rrPubTakephoto","rrPubStatus","rrPubCheckin"]
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        
        for i in 0..<titles.count{
            //一个按钮平均138
            //9+i*129
            let frame = CGRectMake(CGFloat(15+i*129), 10, 129, 35)
            let title = titles[i]
            let image = UIImage(named: imageNames[i])
            //这个方法的做用是将一个字符串的方法名，转换一个选择器类型的实例
            let action = NSSelectorFromString(selectors[i])
            
            //创建一个自定义按钮
            let customButton = CustomButton(frame: frame, image: image!, title: title, target: self, action: action)
            
            //加到屏幕上
            self.view.addSubview(customButton)
            print(self.view.frame)
            
        }
    
    
    }
    //下面这个三个方法是三个自定义按钮的响应方法
    func rrPubTakephoto(){
        print("rrPubTakephoto")
    }
    func rrPubStatus(){
        print("rrPubStatus")
    }
    func rrPubCheckin(){
        print("rrPubCheckin ")
    }
    
    
    
    
    //这个方法用来去配置自定义视图
    func configCustomView(){
        //标题数组
        let titles = ["个人主页","新鲜事","好友","应用","位置","相册","搜索","聊天","站内信"]
        let imageNames = ["gerenzhuye","xinxianshi","haoyou","yingyong","weizhifuwu","xiangce","zhaoren","chat","zhanneixin"]
        
        for i in 0..<titles.count{
        
            let x  = i % 3
            let y = i / 3
            let frame = CGRectMake(CGFloat(15+x*129), CGFloat(80+y*180), 129, 140)
            let title = titles[i]
            let image = UIImage(named: imageNames[i])
            let action : Selector?
            if i == 5 {
                //如果是第6个相册视图的话，那么让他调用下面这个方法
                action = NSSelectorFromString("photosAction")
            }else{
                //其它的视图因为没有实现功能，所以在这里都去调用一个方法
                action = NSSelectorFromString("otherAction")
            }
        
            //创建视图
            let customView = CustomView(frame: frame, image: image!, title: title, target: self, action: action!)
            self.view.addSubview(customView)
        
        }
    }
    
    func photosAction(){
        //弹出相册 页面
        let photosVc = PhotosViewController()
        self.navigationController?.pushViewController(photosVc, animated: true)
    }
    func otherAction(){
        //弹出其它页面
        let otherVC = OthersViewController()
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
