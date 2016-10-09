//
//  UIButton+Util.swift
//  爱限免LimitFree
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

/*
 UIButton的类扩展
 */
extension UIButton {
    
    class func createButton(frame: CGRect,title: String?,bgImageName: String?,target: AnyObject?,action: Selector) -> UIButton {
        
        let button = UIButton(type: .Custom)
        button.frame = frame
        if let tmpTitle = title {
            button.setTitle(tmpTitle, forState: .Normal)
            button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        }
        if let tmpImageName = bgImageName {
            button.setBackgroundImage(UIImage(named: tmpImageName), forState: .Normal)
        }
        if target != nil && action != nil {
            button.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        }
        
        return button
    }
    
    
}