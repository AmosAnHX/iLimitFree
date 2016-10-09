//
//  CustomView.swift
//  RenRenAPP
//
//  Created by KG on 16/9/1.
//  Copyright © 2016年 KG. All rights reserved.
//

import UIKit

class CustomView: UIView {

    init(frame: CGRect,image:UIImage,title:String,target:AnyObject,action:Selector) {
        super.init(frame: frame)
        
        //先去写一张图片
        let imageView = UIImageView()
        imageView.frame = CGRectMake(15, 5, 99, 100)
        imageView.image = image
        self.addSubview(imageView)
        
    
        //标题
        let label = UILabel()
        label.frame = CGRectMake(15, 110, 99, 30)
        label.textAlignment = .Center
        label.font = UIFont.systemFontOfSize(20)
        label.text = title
        self.addSubview(label)
        
        //创建一个手势
        let tap = UITapGestureRecognizer(target: target, action: action)
        //将手势加到背景的view上
        self.addGestureRecognizer(tap)
    
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        

}
