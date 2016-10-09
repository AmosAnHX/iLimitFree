//
//  myPlan.swift
//  打飞机
//
//  Created by qianfeng on 16/8/25.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class MyPlane: Plane {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    
    //重写构造方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //先固定一个我的飞机的位置和大小
        self.frame = CGRectMake(414/2-20, 736-30-40, 40, 40)
        //设置图片
        self.image = UIImage(named: "myplane")
        //设置速度
        self.xSpeed = 10
        
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    

}
