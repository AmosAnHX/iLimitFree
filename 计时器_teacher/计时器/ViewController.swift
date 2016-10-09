//
//  ViewController.swift
//  计时器
//
//  Created by KG on 16/8/25.
//  Copyright © 2016年 KG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //显示系统时间的标签
    let systemTimeLabel = UILabel()
    //显示自定义时间的标签
    let customTimeLabel = UILabel()
    
    
    
    //定义5个变量，表示时间的时分秒
    var s = 0
    var ss = 0
    var m = 0
    var mm = 0
    var h = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
       //配置两个标签
        systemTimeLabel.frame = CGRectMake(7, 50, 400, 50)
        customTimeLabel.frame = CGRectMake(7, 110, 400, 50)
        
        //字体和字号 
        systemTimeLabel.font = UIFont(name: "LcdD", size: 30)
        customTimeLabel.font = UIFont(name: "LcdD", size: 30)
        
        //设置背景色
        systemTimeLabel.backgroundColor = UIColor.cyanColor()
        customTimeLabel.backgroundColor = UIColor.lightGrayColor()
        
        //居中显示
        systemTimeLabel.textAlignment = .Center
        customTimeLabel.textAlignment = .Center
        
        //设置字体颜色
        systemTimeLabel.textColor = UIColor.redColor()
        customTimeLabel.textColor = UIColor.purpleColor()
        
        //设置时间 
        systemTimeLabel.text = getCurrentTimeString()
        customTimeLabel.text = "00:00:00"
        
        //加到屏幕上显示了出来
        self.view.addSubview(systemTimeLabel)
        self.view.addSubview(customTimeLabel)
        
        
        //启动一个定时器管理更新时间 
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updataTime", userInfo: nil, repeats: true)
        
        
    }
    
    //获取系统时间字符串的函数
    func getCurrentTimeString()->String{
    
        //设置时间的显示格式
        //实例一个时间 格式 对象
        let dataFormatter = NSDateFormatter()
        //设置时间 格式 
        //yyyy 或者 yy 代表年
        //MM 表示月份
        //dd 代表天
        //HH 或 hh 代表小时，HH代表24小时进制，hh代表12小时进制
        //ss 表示秒
        //S 表示毫秒
        dataFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss.S"
        
        //下面获取当前时间 
        let currentTime = NSDate()
        
        //将获取的时间按照设置的时间 格式进行格式化
        let timeString = dataFormatter.stringFromDate(currentTime)
        
        
        //将时间串 返回
        return timeString
    }
    
    //定时器的响应方法，用来更新时间
    func updataTime(){
        systemTimeLabel.text = getCurrentTimeString()
        customTimeLabel.text = calcTime()
    }
    
    //计时器更新时间 
    func calcTime() ->String{
   
        s = s + 1   //秒加1
        ss = s / 60 //保存进位
        s = s % 60  //计算时间
        
        m = m + ss  //加进位
        mm = m / 60 //保存进位
        m = m % 60  //计算时间 
        
        h = h + mm //加进位
        h = h % 24  //计算时间
        
        //将时间 拼接成一个字符串
        let timeString = String(format: "%.2d:%.2d:%.2d",h,m,s)
        //返回
        return timeString
        
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

