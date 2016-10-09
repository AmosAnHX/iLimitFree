//
//  CustomButton.swift
//  RenRenAPP
//
//  Created by KG on 16/9/1.
//  Copyright © 2016年 KG. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

//加一个我们需求的构造 方法
    //在自定义这个按钮时，那么需要给足够的条件去创建
    //参数一：位置大小
    //参数二：按钮的图片
    //参数三：按钮的标题
    //参数四：响应方法的执行人
    //参数五：响应方法
    init(frame: CGRect,image:UIImage,title:String,target:AnyObject,action:Selector) {
        super.init(frame: frame)
        
        //先设置背景图片
        let bgImage = UIImage(named: "chat_send_button")?.stretchableImageWithLeftCapWidth(10, topCapHeight: 10)
        self.setBackgroundImage(bgImage, forState: .Normal)
        
        //设置前景图片
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








