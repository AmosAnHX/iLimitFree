//
//  DirectionControl.swift
//  AutoTank
//
//  Created by KG on 16/8/25.
//  Copyright © 2016年 KG. All rights reserved.
//

import UIKit

//定义一个方向的枚举类型

public enum DirectionWithType{
    case UP
    case Down
    case Left
    case Right
}

class DirectionControl: UIView {

    //方向盘要记录要控制的目标
    var target : Tank?
    
    
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
        //重新设置一个固写的frame
        self.frame = CGRectMake(0, 736-80, 414, 80)
        self.backgroundColor = UIColor.lightGrayColor()
        
        
        //布局按钮
        //上按钮
        let upButton = UIButton(type: .System)
        upButton.frame = CGRectMake(414/2-10, 10, 20, 20)
        //图片在使用时，会发生渲染失真的情况，那么在使用时让他们以原图进行渲染，保证图片的正常显示
        let upImage = UIImage(named: "up-s")?.imageWithRenderingMode(.AlwaysOriginal)
        upButton.setImage(upImage, forState: .Normal)
        upButton.addTarget(self, action: "directionContrl:", forControlEvents: .TouchUpInside)
        upButton.tag = 100
        self.addSubview(upButton)
        
        //左按钮
        let leftButton = UIButton(type: .System)
        leftButton.frame = CGRectMake(414/2-30, 30, 20, 20)
        let leftImage = UIImage(named: "left-s")?.imageWithRenderingMode(.AlwaysOriginal)
        leftButton.setImage(leftImage, forState: .Normal)
        leftButton.addTarget(self, action: "directionContrl:", forControlEvents: .TouchUpInside)
        leftButton.tag = 101
        self.addSubview(leftButton)
        
        //右按钮
        let rightButton = UIButton(type: .System)
        rightButton.frame = CGRectMake(414/2+10, 30, 20, 20)
        let rightImage = UIImage(named: "right-s")?.imageWithRenderingMode(.AlwaysOriginal)
        rightButton.setImage(rightImage, forState: .Normal)
        rightButton.addTarget(self, action: "directionContrl:", forControlEvents: .TouchUpInside)
        rightButton.tag = 102
        self.addSubview(rightButton)
        
        //下按钮
        let downButton = UIButton(type: .System)
        downButton.frame = CGRectMake(414/2-10, 50, 20, 20)
        let downImage = UIImage(named: "down-s")?.imageWithRenderingMode(.AlwaysOriginal)
        downButton.setImage(downImage, forState: .Normal)
        downButton.addTarget(self, action: "directionContrl:", forControlEvents: .TouchUpInside)
        downButton.tag = 103
        self.addSubview(downButton)
        
        
        
    }
    //按钮的响应方法
    func directionContrl(button:UIButton){
        switch button.tag - 100{
        case 0:
            //更改目标的方向
            self.target?.directionStatus = .UP
            //改变方向后对应的图片
            self.target!.setImage(UIImage(named: "up-s"), forState: .Disabled)
            break
        case 1:
            self.target?.directionStatus =  .Left
            self.target!.setImage(UIImage(named: "left-s"), forState: .Disabled)
            break
            
        case 2:
            self.target?.directionStatus = .Right
            self.target!.setImage(UIImage(named: "right-s"), forState: .Disabled)
            break
            
        case 3:
            self.target?.directionStatus = .Down
            self.target!.setImage(UIImage(named: "down-s"), forState: .Disabled)
            break
            
        default:
            
            break
        
        }
    
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
