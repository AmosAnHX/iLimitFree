//
//  RegisterViewController.swift
//  人人练习1
//
//  Created by qianfeng on 16/9/1.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

//全局变量,用来去保存用户存放的途径
public let userPath = NSHomeDirectory() + "/Documents/users.plist"


class RegisterViewController: ViewController {

    //有三个输入框
    let accountTextField = UITextField()  //账号
    let passwordTextField = UITextField()  //密码
    let repasswordTextField = UITextField() //重复密码

    override func viewDidLoad() {
        super.viewDidLoad()
        //提示label
        let label = UILabel()
        label.frame = CGRectMake(7, 100, 400, 50)
        label.text = "请输入注册信息"
        label.textAlignment = .Center
        label.font = UIFont.systemFontOfSize(25)
        self.view.addSubview(label)
        
        //账号
        accountTextField.frame = CGRectMake(7, 200, 400, 50)
        accountTextField.font = UIFont.systemFontOfSize(25)
        accountTextField.placeholder = "请输入注册账号/邮箱/手机号"
        accountTextField.autocapitalizationType = .None
        accountTextField.autocorrectionType = .No
        accountTextField.borderStyle = .RoundedRect
        accountTextField.clearButtonMode = .Always
        accountTextField.clearsOnBeginEditing = true
        self.view.addSubview(accountTextField)
        
        //密码
        passwordTextField.frame = CGRectMake(7, 260, 400, 50)
        passwordTextField.font = UIFont.systemFontOfSize(25)
        passwordTextField.placeholder = "请输入密码"
        passwordTextField.autocorrectionType = .No
        passwordTextField.autocapitalizationType = .None
        passwordTextField.borderStyle = .RoundedRect
        passwordTextField.clearsOnBeginEditing = true
        passwordTextField.secureTextEntry = true
        passwordTextField.clearButtonMode = .Always
        self.view.addSubview(passwordTextField)
        
        //重复密码
        repasswordTextField.frame = CGRectMake(7, 320, 400, 50)
        repasswordTextField.font = UIFont.systemFontOfSize(25)
        repasswordTextField.placeholder = "请重复输入密码"
        repasswordTextField.autocorrectionType = .No
        repasswordTextField.autocapitalizationType = .None
        repasswordTextField.borderStyle = .RoundedRect
        repasswordTextField.clearsOnBeginEditing = true
        repasswordTextField.secureTextEntry = true
        repasswordTextField.clearButtonMode = .Always
        self.view.addSubview(repasswordTextField)
        
        
        //按钮
        //返回
        let registerButton = UIButton(type: .System)
        registerButton.frame = CGRectMake(7, 400, 193, 50)
        registerButton.setTitle("返 回", forState: .Normal)
        registerButton.addTarget(self, action: "cancelAction", forControlEvents: .TouchUpInside)
        registerButton.titleLabel?.font = UIFont.systemFontOfSize(25)
        self.view.addSubview(registerButton)
        
        //注册
        let loginButton = UIButton(type: .System)
        loginButton.frame = CGRectMake(207, 400, 193, 50)
        loginButton.setTitle("注 册", forState: .Normal)
        loginButton.addTarget(self, action: "registerAction", forControlEvents: .TouchUpInside)
        loginButton.titleLabel?.font = UIFont.systemFontOfSize(25)
        self.view.addSubview(loginButton)
        
        
        
        
    }
    //注册的响应方法    && array! == [[" ":" "]]
    func registerAction(){
        //先从用户文件中读取所有的用户
        //利用OC提供的数组来从文件中读取一个数组
        let array = NSArray(contentsOfFile: userPath) as? [[String:String]]
        var users = [[String:String]]()
        if array != nil {
            //说明有已注册用户信息
            users.appendContentsOf(array!)
        }
        //把输入框的内容,拿出来,一遍后面使用
        let account = accountTextField.text
        let password = passwordTextField.text
        let repassword = repasswordTextField.text
        
        //判断如果密码和重复密码为空字符串,弹出警告框
        if (account == ""){
            let alertview = UIAlertView(title: "警告", message: "不要闹,请输入账号", delegate: nil, cancelButtonTitle: "OK")
            alertview.show()
            return     
        }else if (password == ""){
            let alertview = UIAlertView(title: "警告", message: "调皮,请输入密码", delegate: nil, cancelButtonTitle: "OK")
            alertview.show()
            return
        }
      
        //定义一个变量,来记录当前注册用户已存在
        var isExist = false  //默认不存在已注册的用户
        
        //循环数组,来判断用户是否存在
        for dict in users {
            let key = dict.keys.first
            if key == account{
                isExist = true
                break
            }
        }
        if isExist == true {
            let alertView = UIAlertView(title: "警告", message: "当前注册用户已存在", delegate: nil, cancelButtonTitle: "OK")
            alertView.show()
        }else{
            if (password == repassword) {
                let user:[String:String] = [account!:password!]
                users.append(user)
                (users as! NSArray).writeToFile(userPath, atomically: true)
                
                self.dismissViewControllerAnimated(true, completion: nil)
            }else{
                let alertView = UIAlertView(title: "警告", message: "两次输入密码不一致", delegate: nil, cancelButtonTitle: "OK")
                alertView.show()
            }
        }
    }
    
    //登录的响应方法
    func cancelAction(){
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
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
