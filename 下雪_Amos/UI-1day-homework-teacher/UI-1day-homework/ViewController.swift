//
//  ViewController.swift
//  UI-1day-homework
//
//  Created by qianfeng on 16/8/23.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //创建一个雪花的数组,用来管理雪花
    var snows = [SnowClass]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //首先将用到的资源文件,拷贝到工程里
        //
        //
        //创建背景图片
        let bgView = UIView()
        bgView.frame = UIScreen.mainScreen().bounds
        
        //取得图片名
        let name = "1_24.jpg"
        //利用图片名创建图片
        let image = UIImage(named: name)
        //将图片转成颜色
        let imageColor = UIColor(patternImage: image!)
        //将图片颜色设置给视图
        bgView.backgroundColor = imageColor
        //将图片放到屏幕显示出来
        self.view.addSubview(bgView)
        
        //启动一个定时器,来创建并且管理雪花
        //      判断边界,超出裁剪
        //      创建雪花
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "snowManager", userInfo: nil, repeats: true)
    }
    
    
    func snowManager(){
       //调用创建雪花的方法
        self.downSnow()
        //让雪花飞
        self.allFling()
        //判断是否超出边界,移除
        self.isByondBounds()
    }
    
    
    
    //下雪的方法
    func downSnow(){
        //创建雪花
        let snow = SnowClass()
        //将雪花加到屏幕上显示出来
        self.view.addSubview(snow)
        //还要将雪花加到数组里,方便管理
        snows.append(snow)
    }
    
    //让所有雪花飞
    func allFling(){
        for snow in snows{
            snow.fling()
        }
    }
    
    //判断雪花是否超出边界
    func isByondBounds(){
        //遍历数组,将超出边界的雪花移除
        for snow in snows{
            if snow.center.y > 450{
                //从屏幕上移除
                snow.removeFromSuperview()
                //从数组中再把雪花移除
                //无法直接删除对象,需要找出索引,再删除
                let index = snows.indexOf(snow)
                snows.removeAtIndex(index!)
            }
        }
        print(snows.count)  //雪花数保持在88个
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

