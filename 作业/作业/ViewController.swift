//
//  ViewController.swift
//  作业
//
//  Created by qianfeng on 16/8/29.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let textField = UITextField()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        textField.frame = CGRectMake(7, 100, 400, 50)
        textField.backgroundColor = UIColor.cyanColor()
        textField.borderStyle = .RoundedRect
        
        textField.font = UIFont.systemFontOfSize(30)
        textField.textColor = UIColor.redColor()
        textField.textAlignment = .Left
        textField.borderStyle = .RoundedRect
        textField.placeholder = "请输入内容"
        textField.clearButtonMode = .Always
        textField.secureTextEntry = true
        textField.clearButtonMode = .Always
        
        //显示明文
        
        let button = UIButton(type: .System)
        button.frame = CGRectMake(0, 0, 50, 50)
        button.setTitle("显示", forState: .Normal)
        button.setTitle("隐藏", forState: .Selected)
        button.addTarget(self, action: "TouchAction:", forControlEvents: .TouchUpInside)
        textField.leftView = button
    
        textField.leftViewMode = .Always
       
        self.view.addSubview(textField)
        
    }
    func TouchAction(button:UIButton){
        button.selected = !button.selected
        if button.selected == true {
            textField.secureTextEntry = false
        }else{
            textField.secureTextEntry = true
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

