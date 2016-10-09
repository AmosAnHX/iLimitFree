//
//  RegisteriewController.swift
//  人人练习2
//
//  Created by qianfeng on 16/9/2.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class RegisteriewController: ViewController {

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
        let cancelButton = UIButton(type: .System)
        cancelButton.frame = CGRectMake(7, 400, 193, 50)
        cancelButton.setTitle("返 回", forState: .Normal)
        cancelButton.addTarget(self, action: "cancelAction", forControlEvents: .TouchUpInside)
        cancelButton.titleLabel?.font = UIFont.systemFontOfSize(25)
        self.view.addSubview(cancelButton)
        
        //注册
        let registerButton = UIButton(type: .System)
        registerButton.frame = CGRectMake(207, 400, 193, 50)
        registerButton.setTitle("注 册", forState: .Normal)
        registerButton.addTarget(self, action: "registerAction", forControlEvents: .TouchUpInside)
        registerButton.titleLabel?.font = UIFont.systemFontOfSize(25)
        self.view.addSubview(registerButton)
        
        
        
        
    }
    //注册响应方法
    func registerAction(){
        //从用户文件中读取所有的用户
        //这个是OC中提供的数组,来从文件中读取一个数组
        let array = NSArray(contentsOfFile: userPath) as? [[String:String]]
        var users = [[String:String]]()
        //判断,array不为空时,说明之前存在用户已注册数据
        //将文件中存在的用户加进数组
        if array != nil {
            users.appendContentsOf(array!)
        }
        
        //把输入框输入的内容拿出来,方便后续使用
        let account = accountTextField.text
        let password = passwordTextField.text
        let repassword = repasswordTextField.text
        //判断 注册信息是否为空字符串,如果为空,弹出警告
        if (account == ""){
            let alertview = UIAlertView(title: "警告", message: "不要闹,请输入账号", delegate: nil, cancelButtonTitle: "OK")
            alertview.show()
            return
        }else if (password == ""){
            let alertview = UIAlertView(title: "警告", message: "调皮,请输入密码", delegate: nil, cancelButtonTitle: "OK")
            alertview.show()
            return
        }
        
        //做一个状态标记,来判断当前注册用户是否存在
        var isExist = false  //默认当前不存在已注册用户
        
        //循环数组,判断用户是否已存在
        for dict in users{
            //先取出字典中的key
            //账号和密码存储是以键值对形式存储的,所有每一个字典都是唯一的
            //字典中的key代表用户名userName,value代表密码password
            let userName = dict.keys.first
            if userName == account{
                //如果文件中的用户名和输入框的account一致,说明账号存在
                isExist = true
                //账号存在不需要重新注册,跳出判断
                break
            }
            
        }
        
        //判断状态
        if isExist == true{
            //账号存在,弹出警告框,告诉用户当前注册用户已存在
            let alertView = UIAlertView(title: "警告", message: "当前注册用户已存在", delegate: nil, cancelButtonTitle: "OK")
            alertView.show()
        }else{
            //如果用不存在,需要记录信息保存下来
            
            //判断两次输入的密码是否一致
            if password == repassword{
                //合法注册,可以将用户保存起来了
                //将输入的内容做成字典存进文件中
                let user:[String:String] = [account!:password!]
                
                //将新的用户信息加到读取的文件的用户数组里
                users.append(user)
                //将swift数组转为OC数组,方便调用方法写入文件,保证用户注册信息保存成功
                (users as! NSArray).writeToFile(userPath, atomically: true)
                //存完文件后,返回上一页面
                self.dismissViewControllerAnimated(true, completion: nil)
            }else{
                //弹出警告框,告诉用户两次输入的密码不同
                let alertView = UIAlertView(title: "警告", message: "两次水输入的密码不一致", delegate: nil, cancelButtonTitle: "Ok")
                alertView.show()
            }
        }
 
    }

    //取消按钮响应方法
    func cancelAction(){
        //取消注销响应,所有操作都无效
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
