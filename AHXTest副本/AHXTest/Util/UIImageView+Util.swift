//
//  UIImageView+Util.swift
//  AHXTest
//
//  Created by qianfeng on 16/10/6.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

/*
 UIImageView的类扩展
 */
extension UIImageView {
    
    //创建图片视图
    class func createImageView(frame: CGRect, imageName: String?) -> UIImageView {
        let imageView = UIImageView(frame: frame)
        if imageName != nil {
            imageView.image = UIImage(named: imageName!)
        }
        return imageView
    }
}
