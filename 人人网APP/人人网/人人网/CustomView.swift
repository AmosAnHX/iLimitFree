//
//  CustomView.swift
//  人人网
//
//  Created by qianfeng on 16/9/1.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class CustomView: UIView {

    init(frame: CGRect,image:UIImage,title:String,target:AnyObject,action:Selector) {
        super.init(frame: frame)
        
        //先写一张图片
        let imageView = UIImageView()
        imageView.frame = CGRectMake(15, 5, 100, 100)
        imageView.image = image
        self.addSubview(imageView)
        
        //标题
        let label = UILabel()
        label.frame = CGRectMake(15, 110, 99, 30)
        label.textAlignment = .Center
        label.font = UIFont.systemFontOfSize(20)
        label.text = title
        self.addSubview(label)
        
        // 创建一个手势
        let tap = UITapGestureRecognizer(target: target, action: action)
        //将手势加到背景的view上
        self.addGestureRecognizer(tap)
        
        

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
