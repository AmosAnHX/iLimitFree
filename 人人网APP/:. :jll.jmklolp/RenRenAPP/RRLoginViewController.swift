//
//  RRLoginViewController.swift
//  RenRenAPP
//
//  Created by KG on 16/8/31.
//  Copyright © 2016年 KG. All rights reserved.
//

import UIKit

class RRLoginViewController: ViewController {

    //将输入框做为成员属性设置，因为方便一会使用
    
    let accountTextField = UITextField() //帐号
    let passwordTextField = UITextField() //密码
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
    
        //进行布局UI
        //LOGO
        let logoImageView = UIImageView()
        logoImageView.frame = CGRectMake(414/2-114/2, 100, 114, 114)
        logoImageView.image = UIImage(named: "Icon")
        self.view.addSubview(logoImageView)
        
        
        //帐号
        accountTextField.frame = CGRectMake(7, 250, 400, 50)
        accountTextField.font = UIFont.systemFontOfSize(30)
        accountTextField.placeholder = "请输入帐号/邮箱/手机号"
        accountTextField.autocapitalizationType = .None
        accountTextField.autocorrectionType = .No
        accountTextField.borderStyle = .RoundedRect
        accountTextField.clearButtonMode = .Always
        accountTextField.clearsOnBeginEditing = true
        self.view.addSubview(accountTextField)
        
        
        //密码
        passwordTextField.frame = CGRectMake(7, 310, 400, 50)
        passwordTextField.font = UIFont.systemFontOfSize(30)
        passwordTextField.placeholder = "请输入密码"
        passwordTextField.autocapitalizationType = .None
        passwordTextField.autocorrectionType = .No
        passwordTextField.borderStyle = .RoundedRect
        passwordTextField.clearButtonMode = .Always
        passwordTextField.clearsOnBeginEditing = true
        passwordTextField.secureTextEntry = true
        //显示明文
        let button = UIButton(type: .System)
        button.frame = CGRectMake(367, 310, 30, 30)
        button.setImage(UIImage(named: "closeEyes")?.imageWithRenderingMode(.AlwaysOriginal), forState: .Normal)
        button.setImage(UIImage(named: "eyes")?.imageWithRenderingMode(.AlwaysOriginal), forState: .Selected)
        button.addTarget(self, action: "TouchAction:", forControlEvents: .TouchUpInside)
        passwordTextField.rightView = button
        passwordTextField.rightViewMode = .Always

        self.view.addSubview(passwordTextField)
        accountTextField.text = "1"
        passwordTextField.text = "1"
        
        
        
        
        //按钮
        //注册
        let registerButton = UIButton(type: .System)
        registerButton.frame = CGRectMake(7, 400, 193, 50)
        registerButton.setTitle("Register", forState: .Normal)
        registerButton.addTarget(self, action: "registerAction", forControlEvents: .TouchUpInside)
        registerButton.titleLabel?.font = UIFont.systemFontOfSize(25)
        self.view.addSubview(registerButton)
        
        
        //登陆按钮
        let loginButton = UIButton(type: .System)
        loginButton.frame = CGRectMake(207, 400, 193, 50)
        loginButton.setTitle("Login", forState: .Normal)
        loginButton.addTarget(self, action: "loginAction", forControlEvents: .TouchUpInside)
        loginButton.titleLabel?.font = UIFont.systemFontOfSize(25)
        self.view.addSubview(loginButton)
    
    }
    //注册响应方法
    func registerAction(){
       
        //弹出注册页面
        let registerVC = RRRegisterViewController()
        registerVC.modalTransitionStyle  = .FlipHorizontal
        self.presentViewController(registerVC, animated: true, completion: nil)
        
    
    }
    //登陆响应方法
    func loginAction(){
        
        //首先去读取用户文件中的所有用户
        let array = NSArray(contentsOfFile: userPath) as? [[String:String]]
        //创建一个swift数组
        var users = [[String:String]]()
        //判断，如果array 不为空，说明原来有用户,那么将这些用户加到users里
        if array != nil{
            users.appendContentsOf(array!)
        }
        
        //记录用户是否存在的变量 
        var isExist = false
        //取出输入的值
        let account = accountTextField.text
        let password = passwordTextField.text
        
        
        //再加一个状态标记
        var isSamePassword = true //默认两次密码一样
        
        //遍历 用户是否存在
        for dict in users{
            //取出用户字典中的用户名和密码
            let userName = dict.keys.first
            let pw = dict[userName!]
            
            //判断
            if account == userName{
                //如果用户名存在，就继续判断密码
                if pw == password{
                    //密码匹配成功，就退出循环
                    isExist = true
                    break
                }else{
                    //当密码不正确时，弹出警告框
                    let alertView = UIAlertView(title: "警告", message: "密码不正确", delegate: nil, cancelButtonTitle: "OK")
                    alertView.show()
                    isSamePassword = false //记录两密码不一样
                }
            
            }
        }
        
        //判断标记
        if isExist == true{
            //如果登陆成功，要弹出首页
            let homeVC = RRHomeViewController()
            //在这要将首面加到导航控制器上
            let nvc = UINavigationController(rootViewController: homeVC)
            //将导航控制器弹出来
            self.presentViewController(nvc, animated: true, completion: { () -> Void in
                self.passwordTextField.text = ""
            })
        }else{
            //输入用户不存在
            //弹出警告框
            let alertView = UIAlertView(title: "警告", message: "输入帐号不存在", delegate: nil, cancelButtonTitle: "OK")
            
            if isSamePassword == true{
                alertView.show()
            }
        }
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
