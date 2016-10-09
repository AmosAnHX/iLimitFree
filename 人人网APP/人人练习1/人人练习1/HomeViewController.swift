//
//  HomeViewController.swift
//  人人练习1
//
//  Created by qianfeng on 16/9/1.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class HomeViewController: BasicViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configCustomButton()
        configCustomView()
        
    }
    //配置按钮
    func configCustomButton(){
        let titles = ["照片","状态","报道"]
        let imageNames = ["rr_pub_takephoto","rr_pub_status","rr_pub_checkin"]
        //响应方法名数组
        let selectors = ["rrPubTakephoto","rrPubStatus","rrPubCheckin"]
        self.automaticallyAdjustsScrollViewInsets = false
        
        for i in 0..<titles.count{
            let frame = CGRectMake(CGFloat(15+i*129), 10, 129, 35)
            let title = titles[i]
            let image = UIImage(named: imageNames[i])
            let action = NSSelectorFromString(selectors[i])
            
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


    //
    func configCustomView(){
        let titles = ["个人主页","新鲜事","好友","应用","位置","相册","搜索","聊天","站内信"]
        let imageNames = ["gerenzhuye","xinxianshi","haoyou","yingyong","weizhifuwu","xiangce","zhaoren","chat","zhanneixin"]
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
            
            //
            let customView = CustomView(frame: frame, image: image!, title: title, target: self, action: action!)
            self.view.addSubview(customView)
        }
    }
    func photosAction(){
        let photoVc = PhotosViewController()
        self.navigationController?.pushViewController(photoVc, animated: true)
    }
    func otherAction(){
        let otherVc = OthersViewController()
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
