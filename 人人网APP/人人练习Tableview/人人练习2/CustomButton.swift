//
//  CustomButton.swift
//  人人练习2
//
//  Created by qianfeng on 16/9/2.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit


//封装一个自定义按钮类


class CustomButton: UIButton {

    //加一个 我们需要的构造方法
    init(frame: CGRect,image:UIImage,title:String,target:AnyObject,action:Selector) {
        super.init(frame: frame)
        //背景照片
        let bgImage = UIImage(named: "chat_send_button")?.stretchableImageWithLeftCapWidth(10, topCapHeight: 10)
        self.setBackgroundImage(bgImage, forState: .Normal)
        //设置前景照片
        self.setImage(image, forState: .Normal)
        
        //设置标题
        self.setTitle(title, forState: .Normal)
        self.titleLabel?.font = UIFont.systemFontOfSize(20)
        self.setTitleColor(UIColor.blackColor(), forState: .Normal)
        
        //加响应事件
        self.addTarget(target, action: action, forControlEvents: .TouchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
