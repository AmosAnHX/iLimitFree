//
//  RegisterViewController.swift
//  人人练习3
//
//  Created by qianfeng on 16/9/3.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class RegisterViewController: ViewController {

    //输入框
    let accountTextField = UITextField()
    let passwordTextField = UITextField()
    let repasswordTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        let label = UILabel()
        label.frame = CGRectMake(7, 100, 400, 50)
        label.text = "请输入注册信息"
        label.textAlignment = .Center
        label.textColor = UIColor.blueColor()
        label.font = UIFont.systemFontOfSize(30)
        self.view.addSubview(label)
        
        //配置
        accountTextField.frame = CGRectMake(7, 200, 400, 50)
        accountTextField.placeholder = "请输入注册账号/邮箱/手机号"
        accountTextField.borderStyle = .RoundedRect
        accountTextField.font = UIFont.systemFontOfSize(25)
        accountTextField.clearButtonMode = .Always
        accountTextField.clearsOnBeginEditing = true
        accountTextField.autocorrectionType = .No
        accountTextField.autocapitalizationType = .None
        self.view.addSubview(accountTextField)
        
        //
        passwordTextField.frame = CGRectMake(7, 260, 400, 50)
        passwordTextField.placeholder = "请输入密码"
        passwordTextField.font = UIFont.systemFontOfSize(25)
        passwordTextField.borderStyle = .RoundedRect
        passwordTextField.autocapitalizationType = .None
        passwordTextField.autocorrectionType = .No
        passwordTextField.clearsOnBeginEditing = true
        passwordTextField.clearButtonMode = .Always
        passwordTextField.secureTextEntry = true
        self.view.addSubview(passwordTextField)
        

        //
        repasswordTextField.frame = CGRectMake(7, 320, 400, 50)
        repasswordTextField.placeholder = "请重复输入密码"
        repasswordTextField.font = UIFont.systemFontOfSize(25)
        repasswordTextField.borderStyle = .RoundedRect
        repasswordTextField.autocapitalizationType = .None
        repasswordTextField.autocorrectionType = .No
        repasswordTextField.clearsOnBeginEditing = true
        repasswordTextField.clearButtonMode = .Always
        repasswordTextField.secureTextEntry = true
        self.view.addSubview(repasswordTextField)
        
        
        
        
        //按钮
        //注册
        let registerButton = UIButton(type: .System)
        registerButton.frame = CGRectMake(207, 400, 193, 50)
        registerButton.setTitle("注 册", forState: .Normal)
        registerButton.setTitleColor(UIColor.blueColor(), forState: .Selected)
        registerButton.addTarget(self, action: "registerButtonAction", forControlEvents: .TouchUpInside)
        registerButton.titleLabel?.font = UIFont.systemFontOfSize(25)
        self.view.addSubview(registerButton)
        //返回
        let cancelButton = UIButton(type: .System)
        cancelButton.frame = CGRectMake(7, 400, 193, 50)
        cancelButton.setTitle("返 回", forState: .Normal)
        cancelButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        cancelButton.addTarget(self, action: "cancelButtonAction", forControlEvents: .TouchUpInside)
        cancelButton.titleLabel?.font = UIFont.systemFontOfSize(25)
        self.view.addSubview(cancelButton)
    }
    //
    func cancelButtonAction(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    //注册响应办法
    func registerButtonAction(){
        let array = NSArray(contentsOfFile: userPath) as? [[String:String]]
        var users = [[String:String]]()
        if array != nil{
            users.appendContentsOf(array!)
        }
        let account = accountTextField.text
        let password = passwordTextField.text
        let repassword = repasswordTextField.text
        if account == "" {
            let alertView = UIAlertView(title: "警 告", message: "请输入账号", delegate: nil, cancelButtonTitle: "OK")
            alertView.show()
            return
        }else if password == "" {
            let alertView = UIAlertView(title: "警 告", message: "请输入密码", delegate: nil, cancelButtonTitle: "Ok")
            alertView.show()
            return
        }
        
        var isExist = false
        
        for dict in users {
            let userName = dict.keys.first
            if userName == account{
                isExist = true
                break
            }
        }
        
        if isExist == true {
            let alertView = UIAlertView(title: "警 告", message: "当前用户已存在", delegate: nil, cancelButtonTitle: "OK")
            alertView.show()
        }else{
            if password == repassword {
                let user:[String:String] = [account!:password!]
                users.append(user)
                (users as! NSArray).writeToFile(userPath, atomically: true)
                
                self.dismissViewControllerAnimated(true, completion: nil)
            }else{
                let alertView = UIAlertView(title: "警 告", message: "两次输入的密码不一致", delegate: nil, cancelButtonTitle: "OK")
                alertView.show()
            }
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
