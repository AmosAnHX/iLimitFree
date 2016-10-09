//
//  ViewController.swift
//  UI-点名
//
//  Created by qianfeng on 16/8/24.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var names = ["康熙","乾隆","嘉庆","崇祯","溥仪","嬴政","刘邦","项羽","李世民","道光","顺治","朱元璋","赵光旭","赵匡胤","姬发","姬昌"]
    var time = NSTimer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        time = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "changeName", userInfo: nil, repeats: true)
        
        let nameLabel = UILabel()
        nameLabel.frame = CGRectMake(7, 80, 400, 80)
        nameLabel.backgroundColor = UIColor.blueColor()
        nameLabel.font = UIFont(name: "Zapfino", size: 30)
        //nameLabel.font = UIFont.systemFontOfSize(30)
        nameLabel.textAlignment = .Center
        nameLabel.textColor = UIColor.redColor()
        nameLabel.text = "康熙"
        nameLabel.tag = 1000
        self.view.addSubview(nameLabel)
        
        let button = UIButton(type: .System)
        button.frame = CGRectMake(107, 500, 200, 50)
        button.backgroundColor = UIColor.brownColor()
        button.alpha = 0.5
        button.setTitle("  暂停点名  ", forState: .Normal)
        button.setTitle("  开始点名  ", forState: .Selected)
        button.addTarget(self, action: "controlName:", forControlEvents: .TouchUpInside)
        self.view.addSubview(button)
        
    
    }
    func changeName(){
        let nameLabel = self.view.viewWithTag(1000) as! UILabel
        let count = UInt32(names.count)
        let index = arc4random_uniform(count)
        let name = names[Int(index)]
        nameLabel.text = name
    }
    
    func controlName(button:UIButton){
        button.selected = !button.selected
        
//        if button.selected == true
//        {
//            button.selected = false
//        }else
//        {
//            button.selected = true
//        }
//        
        if button.selected == true
        {
            time.fireDate = NSDate.distantFuture()
        }else
        {
            time.fireDate = NSDate.distantPast()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

