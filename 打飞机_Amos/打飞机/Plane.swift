//
//  Plan.swift
//  打飞机
//
//  Created by qianfeng on 16/8/25.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit


//抽象一个飞机的类
//这个飞机类是父类,用来继承使用


class Plane: UIImageView {
    
    //飞机有两个属性来记录飞机的飞行速度
    var xSpeed:CGFloat = 0.0
    var ySpeed:CGFloat = 0.0
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    func fly(){
        UIView.animateWithDuration(0.2) { () -> Void in
            
            self.center.x += self.xSpeed
            self.center.y += self.ySpeed
            
        }
        
    }
    
    
    
    

    
    
    
    
    
    
    
    
    
    
    

}
