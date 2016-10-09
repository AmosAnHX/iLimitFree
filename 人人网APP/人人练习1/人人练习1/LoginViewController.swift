//
//  LoginViewController.swift
//  人人练习1
//
//  Created by qianfeng on 16/9/1.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class LoginViewController: ViewController {

    //将输入框作为成员属性设置,因为方便使用
    let accountTextField = UITextField()  //账号
    let passwordTextField = UITextField()  //密码
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //进行UI布局
        //LOGO
        let logoImageView = UIImageView()
        logoImageView.frame = CGRectMake(414/2-114/2, 100, 114, 114)
        logoImageView.image = UIImage(named: "Icon")
        
        self.view.addSubview(logoImageView)
        
        //账号
        accountTextField.frame = CGRectMake(7, 250, 400, 50)
        accountTextField.font = UIFont.systemFontOfSize(25)
        accountTextField.placeholder = "请输入账号/邮箱/手机号"
        accountTextField.autocapitalizationType = .None
        accountTextField.autocorrectionType = .No
        accountTextField.borderStyle = .RoundedRect
        accountTextField.clearButtonMode = .Always
        accountTextField.clearsOnBeginEditing = true
        accountTextField.text = "q"
        self.view.addSubview(accountTextField)
        
        //密码
        passwordTextField.frame = CGRectMake(7, 310, 400, 50)
        passwordTextField.font = UIFont.systemFontOfSize(25)
        passwordTextField.placeholder = "请输入密码"
        passwordTextField.autocorrectionType = .No
        passwordTextField.autocapitalizationType = .None
        passwordTextField.borderStyle = .RoundedRect
        passwordTextField.clearsOnBeginEditing = true
        passwordTextField.clearButtonMode = .Always
        passwordTextField.text = "q"
        //显示明文
        let button = UIButton(type: .System)
        button.frame = CGRectMake(367, 310, 30, 30)
        button.setImage(UIImage(named: "closeEyes")?.imageWithRenderingMode(.AlwaysOriginal), forState: .Normal)
        button.setImage(UIImage(named: "eyes")?.imageWithRenderingMode(.AlwaysOriginal), forState: .Selected)
        button.addTarget(self, action: "TouchAction:", forControlEvents: .TouchUpInside)
        passwordTextField.rightView = button
        passwordTextField.secureTextEntry = true
        self.view.addSubview(passwordTextField)
        
        
        
        //按钮
        //注册
        let registerButton = UIButton(type: .System)
        registerButton.frame = CGRectMake(7, 400, 193, 50)
        registerButton.setTitle("注 册", forState: .Normal)
        registerButton.addTarget(self, action: "registerAction", forControlEvents: .TouchUpInside)
        registerButton.titleLabel?.font = UIFont.systemFontOfSize(25)
        self.view.addSubview(registerButton)
        
        //登录
        let loginButton = UIButton(type: .System)
        loginButton.frame = CGRectMake(207, 400, 193, 50)
        loginButton.setTitle("登 录", forState: .Normal)
        loginButton.addTarget(self, action: "loginAction", forControlEvents: .TouchUpInside)
        loginButton.titleLabel?.font = UIFont.systemFontOfSize(25)
        self.view.addSubview(loginButton)
        
        
        
        
        
        
        
    }
    //注册的响应方法
    func registerAction(){
        //弹出注册页面
        let registerVc = RegisterViewController()
        registerVc.modalTransitionStyle = .FlipHorizontal
        self.presentViewController(registerVc, animated: true, completion: nil)
        
    }
    //登录的响应方法
    func loginAction(){
        let array = NSArray(contentsOfFile: userPath) as? [[String:String]]
        var users = [[String:String]]()
        if array != nil{
            users.appendContentsOf(array!)
        }
        var isExist = false
        
        let account = accountTextField.text
        let password = passwordTextField.text
        
        if (account == ""){
            let alertview = UIAlertView(title: "警告", message: "不要闹,请输入账号", delegate: nil, cancelButtonTitle: "OK")
            alertview.show()
            return
        }else if (password == ""){
            let alertview = UIAlertView(title: "警告", message: "调皮,请输入密码", delegate: nil, cancelButtonTitle: "OK")
            alertview.show()
            return
        }
        
        
        var isSamePassword = true
        
        for dict in users{
            let userName = dict.keys.first
            let userPassword = dict[userName!]
            
            if account == userName{
                if password == userPassword{
                    isExist = true
                    break
                }else{
                    let alertView = UIAlertView(title: "警告", message: "密码不正确", delegate: nil, cancelButtonTitle: "OK")
                    alertView.show()
                    isSamePassword = false
                }
            }
        }
        if isExist == true{
            let homeVc = HomeViewController()
            let nvc = UINavigationController(rootViewController: homeVc)
            self.presentViewController(nvc, animated: true, completion: nil)
        }else{
            let alertView = UIAlertView(title: "警告", message: "输入账号不存在", delegate: nil, cancelButtonTitle: "OK")
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
