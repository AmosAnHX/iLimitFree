//
//  Direction.swift
//  打飞机
//
//  Created by qianfeng on 16/8/25.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class Direction: UIView {
    
    
    internal var myPlane:MyPlane?
    
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //操作区固定大小
        self.frame = CGRectMake(0, 706, 414, 30)
        self.backgroundColor = UIColor.blackColor()
        self.alpha = 0.5
        
        
        
        //左按钮
        let leftButton = UIButton()
        leftButton.frame = CGRectMake(0, 0, 50, 30)
        leftButton.setImage(UIImage(named: "button_left"), forState: .Normal)
        leftButton.tag = 100
        leftButton.addTarget(self, action: "buttonAction:", forControlEvents: .TouchUpInside)
        self.addSubview(leftButton)
        
        
        //右按钮
        let rightButton = UIButton()
        rightButton.frame = CGRectMake(414-50, 0, 50, 30)
        rightButton.setImage(UIImage(named: "button_right"), forState: .Normal)
        rightButton.tag = 200
        rightButton.addTarget(self, action: "buttonAction:", forControlEvents: .TouchUpInside)
        self.addSubview(rightButton)
        
        
    }
    //按钮响应方法
    func buttonAction(button:UIButton){
        if button.tag == 100{
            self.myPlane!.xSpeed = -10
        }else{
            self.myPlane!.xSpeed = 10
        }
        self.myPlane?.fly()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
