//
//  CustomView.swift
//  人人练习2
//
//  Created by qianfeng on 16/9/2.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

//封装一个视图类

class CustomView: UIView {

    init(frame: CGRect,image:UIImage,title:String,target:AnyObject,action:Selector) {
        super.init(frame: frame)
        
        //添加照片  
        //配置一下,需要调用时在重写属性
        let imageView = UIImageView()
        imageView.frame = CGRectMake(15, 5, 99, 100)
        imageView.image = image
        self.addSubview(imageView)
        
        //添加一个label
        //调用时再重新改写属性
        let label = UILabel()
        label.frame = CGRectMake(15, 110, 99, 30)
        label.textAlignment = .Center
        label.font = UIFont.systemFontOfSize(20)
        label.text = title
        self.addSubview(label)
        
        //添加一个手势
        //属性调用时重写
        let tap = UITapGestureRecognizer(target: target, action: action)
        self.addGestureRecognizer(tap)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
