//
//  ViewController.swift
//  计时器
//
//  Created by qianfeng on 16/8/24.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numArray = [Int]()
    let label = UILabel()
    var time = NSTimer()
    let startButton = UIButton(type: .System)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        
        //显示屏
        
        label.frame = CGRectMake(0, 20, 414, 350)
        label.backgroundColor = UIColor.whiteColor()
        label.text = "00:00:00"
        //label.text = strMinute + ":" + strSecond
        label.font = UIFont(name: "LcdD", size: 80)
        label.textAlignment = .Center
        label.tag = 1
        self.view.addSubview(label)
        
        
        
        //启动按钮
        
        startButton.frame = CGRectMake(140, 400, 150, 60)
        startButton.backgroundColor = UIColor.lightGrayColor()
        startButton.setTitle("启  动", forState: .Normal)
        
        startButton.addTarget(self, action: "startButtonAction:", forControlEvents: .TouchUpInside)
        self.view.addSubview(startButton)
        
        //暂停按钮
        let stopButton = UIButton(type: .System)
        stopButton.frame = CGRectMake(80, 500, 100, 50)
        stopButton.backgroundColor = UIColor.lightGrayColor()
        stopButton.setTitle("暂  停", forState: .Normal)
        
        stopButton.addTarget(self, action: "stopButtonAction:", forControlEvents: .TouchUpInside)
        self.view.addSubview(stopButton)
        
        //重置按钮
        let replaceButton = UIButton(type: .System)
        replaceButton.frame = CGRectMake(230, 500, 100, 50)
        replaceButton.backgroundColor = UIColor.lightGrayColor()
        replaceButton.setTitle("重  置", forState: .Normal)
        
        replaceButton.addTarget(self, action: "replaceButtonAction:", forControlEvents: .TouchUpInside)
        self.view.addSubview(replaceButton)

    }

    //计数器转为时间
    var hour = 0
    var minute = 0
    var count = 0
    var second = 0
    

    func run(){
        let label = self.view.viewWithTag(1) as! UILabel
        for second in 0..<60{
            numArray.append(second)
        }

        label.text = "\(hour):\(minute):\(String(numArray[second++]))"
        if second > 59{
            second = 0
            minute += 1
        }else if minute > 59{
            minute = 0
            hour += 1
        }else if hour > 23{
            hour = 0
        }
        
    }


    func startButtonAction(startButton:UIButton){
        startButton.enabled = !startButton.enabled
        time = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "run", userInfo: nil, repeats: true)
        time.fireDate = NSDate.distantPast()
    }
    func stopButtonAction(stopButton:UIButton){
        startButton.enabled = true
        time.fireDate = NSDate.distantFuture()
    }
    func replaceButtonAction(button:UIButton){
        startButton.enabled = true
        label.text = "00:00:00"
        hour = 0
        minute = 0
        count = 0
        second = 0
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

