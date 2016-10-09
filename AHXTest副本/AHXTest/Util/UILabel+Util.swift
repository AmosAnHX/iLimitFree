//
//  UILabel+Util.swift
//  爱限免LimitFree
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

/*
 UILabel的类扩展
 */
extension UILabel {
    
    //创建UILabel的一个方法
    class func createLabel(frame:CGRect, title: String?, textAlignment: NSTextAlignment?) -> UILabel {
        
        let label = UILabel(frame: frame)
        label.text = title

        if let tmpAlignment = textAlignment {
            label.textAlignment = tmpAlignment
        }
        return label
    }
}