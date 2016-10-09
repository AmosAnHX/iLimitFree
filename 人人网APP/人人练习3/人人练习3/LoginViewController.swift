//
//  LoginViewController.swift
//  人人练习3
//
//  Created by qianfeng on 16/9/3.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

public let userPath = NSHomeDirectory() + "/Documents/users.plist"


class LoginViewController: ViewController {

    //输入框
    let accountTextField = UITextField()
    let passwordTextField = UITextField()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //logo
        let logoimageView = UIImageView()
        logoimageView.frame = CGRectMake(414/2-114/2, 100, 114, 114)
        logoimageView.image = UIImage(named: "Icon")
        self.view.addSubview(logoimageView)
        //配置
        accountTextField.frame = CGRectMake(7, 250, 400, 50)
        accountTextField.placeholder = "请输入账号/邮箱/手机号"
        accountTextField.borderStyle = .RoundedRect
        accountTextField.font = UIFont.systemFontOfSize(30)
        accountTextField.clearButtonMode = .Always
        accountTextField.clearsOnBeginEditing = true
        accountTextField.autocorrectionType = .No
        accountTextField.autocapitalizationType = .None
        self.view.addSubview(accountTextField)
        
        //
        passwordTextField.frame = CGRectMake(7, 310, 400, 50)
        passwordTextField.placeholder = "请输入密码"
        passwordTextField.font = UIFont.systemFontOfSize(30)
        passwordTextField.borderStyle = .RoundedRect
        passwordTextField.autocapitalizationType = .None
        passwordTextField.autocorrectionType = .No
        passwordTextField.clearsOnBeginEditing = true
        passwordTextField.clearButtonMode = .Always
        passwordTextField.secureTextEntry = true
        
        let button = UIButton()
        button.frame = CGRectMake(367, 310, 40, 40)
        button.setImage(UIImage(named: "closeEyes")?.imageWithRenderingMode(.AlwaysOriginal), forState: .Normal)
        button.setImage(UIImage(named: "eyes")?.imageWithRenderingMode(.AlwaysOriginal), forState: .Selected)
        button.addTarget(self, action: "TouchAction:", forControlEvents: .TouchUpInside)
        passwordTextField.rightView = button
        passwordTextField.rightViewMode = .Always
        self.view.addSubview(passwordTextField)
        
        //按钮
        //注册
        let registerButton = UIButton(type: .System)
        registerButton.frame = CGRectMake(7, 400, 193, 50)
        registerButton.setTitle("注 册", forState: .Normal)
        registerButton.setTitleColor(UIColor.blueColor(), forState: .Selected)
        registerButton.addTarget(self, action: "registerButtonAction", forControlEvents: .TouchUpInside)
        registerButton.titleLabel?.font = UIFont.systemFontOfSize(25)
        self.view.addSubview(registerButton)
        //登录
        let loginButton = UIButton(type: .System)
        loginButton.frame = CGRectMake(207, 400, 193, 50)
        loginButton.setTitle("登 录", forState: .Normal)
        loginButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        loginButton.addTarget(self, action: "loginButtonAction", forControlEvents: .TouchUpInside)
        loginButton.titleLabel?.font = UIFont.systemFontOfSize(25)
        self.view.addSubview(loginButton)
    }
    
    //注册响应方法
    func registerButtonAction(){
        let registerVc = RegisterViewController()
        registerVc.modalTransitionStyle = .FlipHorizontal
        self.presentViewController(registerVc, animated: true, completion: nil)
        
    }
    //登录响应方法
    func loginButtonAction(){
        let array = NSArray(contentsOfFile: userPath) as? [[String:String]]
        var users = [[String:String]]()
        if array != nil{
            users.appendContentsOf(array!)
        }
        var isExist = false
        var isSamePassword = true
        let account = accountTextField.text
        let password = passwordTextField.text
        
        for dict in users {
            let userName = dict.keys.first
            let userPassword = dict[userName!]
            
            if account == userName{
                if password == userPassword {
                    isExist = true
                    break
                }else{
                    let alertView = UIAlertView(title: "警 告", message: "密码不正确", delegate: nil, cancelButtonTitle: "Ok")
                    alertView.show()
                    isSamePassword = false
                }
            }
        }
        if isExist == true {
            let homeVc = HomeViewController()
            let nvc = UINavigationController(rootViewController: homeVc)
            self.presentViewController(nvc, animated: true, completion: { () -> Void in
                self.passwordTextField.text = ""
            })
        }else{
            let alertView = UIAlertView(title: "警 告", message: "用户不存在", delegate: nil, cancelButtonTitle: "OK")
            if isSamePassword == true{
                alertView.show()
            }
        }

    }
    
    //隐藏密码
    func TouchAction(button:UIButton){
        button.selected = !button.selected
        if button.selected == true{
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
