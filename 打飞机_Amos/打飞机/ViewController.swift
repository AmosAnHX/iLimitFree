//
//  ViewController.swift
//  打飞机
//
//  Created by qianfeng on 16/8/25.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //创建一个数组,用来装敌人的飞机
    var enemyPlanes = [EnemyPlane]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //
        creatBackgroudImage()
        //
        creatMyPlane()
        //
        creatTimer()
        
    }
    //设置背景图片
    func creatBackgroudImage(){
        let bgImageView = UIImageView()
        bgImageView.frame = UIScreen.mainScreen().bounds
        bgImageView.image = UIImage(named: "background")
        bgImageView.userInteractionEnabled = true
        self.view.addSubview(bgImageView)
    }
    
    
    //创建我的飞机和方向盘
    func creatMyPlane(){
        //创建我的飞机
        let myPlane = MyPlane(frame:CGRectMake(0, 0, 0, 0))
        //创建方向盘
        let direction = Direction()
        //让方向盘和我的飞机联系起来
        direction.myPlane = myPlane
        self.view.addSubview(myPlane)
        self.view.addSubview(direction)
    }
    
    //创建定时器
    func creatTimer(){
        NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "gameManager", userInfo: nil, repeats: true)
    }
    //定时器响应方法
    func gameManager(){
        
        creatEnemyPlane()
        enemyPlaneWithFly()
    }
    
    //创建敌人的飞机,把创建的飞机加进数组里
    func creatEnemyPlane(){
        //创建敌人的飞机
        let enemyPlane = EnemyPlane(frame: CGRectMake(0, 0, 0, 0))
        self.view.addSubview(enemyPlane)
        //创建的敌机加进数组里
        enemyPlanes.append(enemyPlane)
    }
    
    //让飞机飞起来
    func enemyPlaneWithFly(){
        //遍历飞机数组
        for enemyPlane in enemyPlanes{
            //让飞机飞起来
            enemyPlane.fly()
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

