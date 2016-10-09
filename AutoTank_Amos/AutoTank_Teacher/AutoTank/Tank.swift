//
//  Tank.swift
//  AutoTank
//
//  Created by KG on 16/8/25.
//  Copyright © 2016年 KG. All rights reserved.
//

import UIKit

class Tank: UIButton {

    //应该有一个记录当前方向状态的属性
    //默认状态是上方向
    var directionStatus = DirectionWithType.UP
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //固定自己的frame
        self.frame = CGRectMake(414/2-25, 736-80-50, 50, 50)
        
        //设置图片
        self.setImage(UIImage(named: "up-s"), forState: .Disabled)
        
        //因为这个也是一个按钮，但是他只负责显示和移动
        self.enabled = false
        
        //启动一个定时器，来控制坦克一直移动
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "move", userInfo: nil, repeats: true)
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //坦克移动的方法
    func move(){
        //给移动加一个动画
        UIView.animateWithDuration(0.5) { () -> Void in
            switch self.directionStatus {
            case .UP:
                self.center.y -= 5
            case .Down:
                self.center.y += 5
            case .Left:
                self.center.x -= 5
            case .Right:
                self.center.x += 5
            }
        }
  
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
