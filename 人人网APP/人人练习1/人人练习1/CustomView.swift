//
//  CustomView.swift
//  人人练习1
//
//  Created by qianfeng on 16/9/2.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class CustomView: UIView {

    init(frame: CGRect,image:UIImage,title:String,target:AnyObject,action:Selector) {
        super.init(frame: frame)
        
        //
        let imageView = UIImageView()
        imageView.frame = CGRectMake(15, 5, 99, 100)
        imageView.image = image
        self.addSubview(imageView)
        
        //
        let label = UILabel()
        label.frame = CGRectMake(15, 110, 99, 30)
        label.textAlignment = .Center
        label.font = UIFont.systemFontOfSize(20)
        label.text = title
        self.addSubview(label)
        
        //
        let tap = UITapGestureRecognizer(target: target, action: action)
        self.addGestureRecognizer(tap)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
