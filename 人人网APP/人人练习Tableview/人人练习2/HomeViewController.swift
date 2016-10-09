//
//  HomeViewController.swift
//  人人练习2
//
//  Created by qianfeng on 16/9/2.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

//主页

class HomeViewController: BasicViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configCustomButton()
        configCustomView()
        
    }
    //配置三个按钮
    func configCustomButton(){
        let titles = ["照片","状态","报道"]
        let imageNames = ["rr_pub_takephoto","rr_pub_status","rr_pub_checkin"]
        //响应方法名数组
        let selectors = ["rrPubTakephoto","rrPubStatus","rrPubCheckin"]
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        //循环布局三个按钮视图
        for i in 0..<titles.count{
            let frame = CGRectMake(CGFloat(15+i*129), 10, 129, 35)
            let title = titles[i]
            let image = UIImage(named: imageNames[i])
            let action = NSSelectorFromString(selectors[i])
            
            //利用封装的CustomButton类来自定义布局按钮
            let customButton = CustomButton(frame: frame, image: image!, title: title, target: self, action: action)
            
            self.view.addSubview(customButton)
            
            print(self.view.frame)
            
        }
    }
    func rrPubTakephoto(){
        print("rrPubTakephoto")
    }
    func rrPubStatus(){
        print("rrPubStatus")
    }
    func rrPubCheckin(){
        print("rrPubCheckin ")
    }
    
    
    //布局UI
    func configCustomView(){
        
        let titles = ["个人主页","新鲜事","好友","应用","位置","相册","搜索","聊天","站内信"]
        
        let imageNames = ["gerenzhuye","xinxianshi","haoyou","yingyong","weizhifuwu","xiangce","zhaoren","chat","zhanneixin"]
        //遍历标题数组,生成视图
        for i in 0..<titles.count{
            let x = i % 3
            let y = i / 3
            let frame = CGRectMake(CGFloat(15+x*129), CGFloat(y*180+80), 129, 140)
            let title = titles[i]
            let image = UIImage(named: imageNames[i])
            let action : Selector?
            if i == 5{
                action = NSSelectorFromString("photosAction")
            }else{
                action = NSSelectorFromString("otherAction")
            }
            
            //调用封装的视图类来自定义视图
            let customView = CustomView(frame: frame, image: image!, title: title, target: self, action: action!)
            
            self.view.addSubview(customView)
        }
    }
    //点击相册的响应方法,如果点击的是相册,就弹出相册列表
    func photosAction(){
        let photoVc = PhotosViewController()
        self.navigationController?.pushViewController(photoVc, animated: true)
    }
    //点击其他的响应方法,弹出同一个暂无内容的视图
    func otherAction(){
        let otherVc = OtherViewController()
        self.navigationController?.pushViewController(otherVc, animated: true)
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
