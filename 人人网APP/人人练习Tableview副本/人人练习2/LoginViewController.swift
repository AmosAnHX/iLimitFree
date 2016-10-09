//
//  LoginViewController.swift
//  人人练习2
//
//  Created by qianfeng on 16/9/2.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

//全局变量,用来去保存用户存放的途径
public let userPath = NSHomeDirectory() + "/Documents/users.plist"


class LoginViewController: ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        accountTextField.autocapitalizationType = .None
        accountTextField.autocorrectionType = .No
        
        passwordTextField.autocapitalizationType = .None
        passwordTextField.autocorrectionType = .No
        
        //显示明文
        let button = UIButton()
        button.frame = CGRectMake(350 , 354, 25, 25)
        button.setImage(UIImage(named: "closeEyes")?.imageWithRenderingMode(.AlwaysOriginal), forState: .Normal)
        button.setImage(UIImage(named: "eyes")?.imageWithRenderingMode(.AlwaysOriginal), forState: .Selected)
        button.addTarget(self, action: "TouchAction:", forControlEvents: .TouchUpInside)
        passwordTextField.rightView = button
        passwordTextField.rightViewMode = .Always
        self.view.addSubview(passwordTextField)
    }
    
    
    @IBOutlet var LoginViewController: UIView!
    
    @IBOutlet weak var logoimageView: UIImageView!
    
    @IBOutlet weak var accountLabel: UILabel!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var accountTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!

    @IBAction func registerButtonAction(sender: AnyObject) {
        
        //弹出注册页面
        let registerVC = RegisteriewController()
        registerVC.modalTransitionStyle = .FlipHorizontal // 页面跳转为水平翻转
        self.presentViewController(registerVC, animated: true, completion: nil)
        
    }
    
    
    @IBAction func loginButtonAction(sender: AnyObject) {
        
        //首先读取用户文件中的所有用户
        //将读取的OC文件转化为swift的字典类型
        let array = NSArray(contentsOfFile: userPath) as? [[String:String]]
        //创建一个以字典为元素的swift数组,初始化
        var users = [[String:String]]()
        
        //判断,如果array不为空,说明原来存在已注册用户,那么将这些用户加到users数组里
        if array != nil{
            users.appendContentsOf(array!)
        }
        
        //取出输入框输入的值
        let account = accountTextField.text
        let password = passwordTextField.text
        //消除当account和password为空字符串情况
        if (account == ""){
            let alertview = UIAlertView(title: "警告", message: "请输入账号", delegate: nil, cancelButtonTitle: "OK")
            alertview.show()
            return
        }else if (password == ""){
            let alertview = UIAlertView(title: "警告", message: "请输入密码", delegate: nil, cancelButtonTitle: "OK")
            alertview.show()
            return
        }
        
        //加一个状态标记,用来记录用户是否存在
        var isExist = false
        
        //加一个状态标记,用来记录字典保存的密码和输入的密码是否一致
        var isSamePassword = true  //默认两次密码一样
        
        //遍历这个数组里的字典元素,判断用户是否存在
        for dict in users{
            //取出字典中存储的(userName - password)键值对
            //因为每一个字典都存储唯一一对键值对,字典的key代表用户名nuesrName,取出字典的key就是取出用户的用户名
            //  value = dictionary[key]
            let userName = dict.keys.first
            let userPassword = dict[userName!]
            
            //判断
            if account == userName{
                //如果用户名存在,就继续判断密码
                if password == userPassword{
                    //如果密码匹配成功,跳出循环
                    isExist = true
                    break
                }else{
                    //当密码匹配失败,弹出警告框
                    let alertView = UIAlertView(title: "警告", message: "密码不正确", delegate: nil, cancelButtonTitle: "OK")
                    alertView.show()
                    //记录两次密码不一样
                    isSamePassword = false
                    
                }
            }
        }
        //如果登录成功,弹出HomeViewController
        if isExist == true{
            let homeVC = HomeViewController()
            //在这要将首页加到导航控制器上
            let nvc = UINavigationController(rootViewController: homeVC)
            //将导航控制器弹出来,弹出首页HomeViewController
            self.presentViewController(nvc, animated: true, completion: { () -> Void in
                self.passwordTextField.text = ""
            })
        }else{
            //输入的用户不存在,弹出警告框
            let alertView = UIAlertView(title: "警告", message: "输入的账号不存在", delegate: nil, cancelButtonTitle: "OK")
            //为了消除弹出"密码不正确"警告框这个bug,让isSamePassword为真时展示alertView
            if isSamePassword == true{
                alertView.show()
            }
        }
    }


    @IBAction func lookPasswordButtonAction(sender: AnyObject) {
        
    }
    //可视密码的响应方法
    func TouchAction(button:UIButton){
        button.selected = !button.selected
        if button.selected == true {
            passwordTextField.secureTextEntry = false
        }else{
            passwordTextField.secureTextEntry = true
        }
    }
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
}
