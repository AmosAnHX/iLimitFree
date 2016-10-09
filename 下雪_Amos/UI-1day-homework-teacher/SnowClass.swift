//
//  SnowClass.swift
//  UI-1day-homework
//
//  Created by qianfeng on 16/8/24.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class SnowClass: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    override init(frame:CGRect) {
        
        //先调用父类的构造方法
        super.init(frame:frame)
        
        //在iOS中,默认支持的图片格式是png格式,当在程序中使用png格式时,可以默认加载扩展名.png.
        //如果不是png格式的图片,必须要加扩展名,加到图片名的后面
        let snowImage = UIImage(named: "snow")
        let snowColor = UIColor(patternImage: snowImage!)
        self.backgroundColor = snowColor
        
        //设置图片的位置和大小
        //获取随机的x值
        let x = CGFloat(arc4random_uniform(320))
        let frame = CGRectMake(x, 0, 20, 20)
        
        self.frame = frame
    }
    
    required init?(coder aDecoder:NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    //实现雪花飘飞的方法
    func fling(){
        //取出当前雪花的中心点
        var center = self.center
        
        //雪花纵向移动
        center.y += 8
        //得到随机的一个左右移动区间
        let x = CGFloat(arc4random_uniform(7))%7
        center.x += x
       
        
        //加一个动画
        UIView.animateWithDuration(0.5) { () -> Void in
           //动画的功能:将改变后的中心点,重新赋给雪花
            self.center = center
        }
        
        
        
    }
    
    
}
