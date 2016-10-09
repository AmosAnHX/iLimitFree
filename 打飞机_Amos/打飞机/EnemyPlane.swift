//
//  EnemyPlane.swift
//  打飞机
//
//  Created by qianfeng on 16/8/25.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class EnemyPlane: Plane {
    
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
        let x = CGFloat(arc4random_uniform(414-40))
        self.frame = CGRectMake(x, 0, 40, 40)
        
        //设置图片
        let n = arc4random_uniform(4) + 1
        let image = UIImage(named: "enemy\(n)")
        self.image = image
        
        //设置飞机速度
        let speed = arc4random_uniform(5) + arc4random_uniform(5) + 3
        
        self.ySpeed = CGFloat(speed)
        
        
        //设置飞机被击中的爆炸效果
        var images = [UIImage]()
        for i in 1..<20{
            let imageName = "bossbomb\(i)"
            let image = UIImage(named: imageName)
            images.append(image!)
        }
        self.animationRepeatCount = 1
        self.animationDuration = 0.2
        self.animationImages = images
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


}
