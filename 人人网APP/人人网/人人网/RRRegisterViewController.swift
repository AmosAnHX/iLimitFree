//
//  RRRegisterViewController.swift
//  人人网
//
//  Created by qianfeng on 16/8/31.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

//注册界面



//全局变量,用来去保存用户存放的路径
public let userPath = NSHomeDirectory() + "/Documents/users.plist"


class RRRegisterViewController: ViewController {

    //有三个输入框
    let accountTextField = UITextField()  //账号
    let passwordTextField = UITextField()  //密码
    let repasswordTextField = UITextField()  //重复密码
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //提示label
        let titleLabel = UILabel()
        titleLabel.frame = CGRectMake(7, 100, 400, 50)
        titleLabel.text = "请输入注册信息"
        titleLabel.textAlignment = .Center
        titleLabel.font = UIFont.systemFontOfSize(30)
        self.view.addSubview(titleLabel)
        
        //账号
        accountTextField.frame = CGRectMake(7, 200, 400, 50)
        accountTextField.font = UIFont.systemFontOfSize(30)
        accountTextField.placeholder = "请输入注册账号/邮箱/手机号"
        accountTextField.autocapitalizationType = .None
        accountTextField.autocorrectionType = .No
        accountTextField.borderStyle = .RoundedRect
        accountTextField.clearButtonMode = .Always
        accountTextField.clearsOnBeginEditing = true
        
        self.view.addSubview(accountTextField)
        
        //密码
        passwordTextField.frame = CGRectMake(7, 260, 400, 50)
        passwordTextField.font = UIFont.systemFontOfSize(30)
        passwordTextField.placeholder = "请输入密码"
        passwordTextField.autocapitalizationType = .None
        passwordTextField.autocorrectionType = .No
        passwordTextField.borderStyle = .RoundedRect
        passwordTextField.clearButtonMode = .Always
        passwordTextField.clearsOnBeginEditing = true
        passwordTextField.secureTextEntry = true
        
        self.view.addSubview(passwordTextField)
        
        //重复密码
        repasswordTextField.frame = CGRectMake(7, 320, 400, 50)
        repasswordTextField.font = UIFont.systemFontOfSize(30)
        repasswordTextField.placeholder = "请重复输入密码"
        repasswordTextField.autocapitalizationType = .None
        repasswordTextField.autocorrectionType = .No
        repasswordTextField.borderStyle = .RoundedRect
        repasswordTextField.clearButtonMode = .Always
        repasswordTextField.clearsOnBeginEditing = true
        repasswordTextField.secureTextEntry = true
        
        self.view.addSubview(repasswordTextField)
        
        
        
        
        //按钮
        //注册按钮
        let registerButton = UIButton(type: .System)
        registerButton.frame = CGRectMake(7, 400, 193, 50)
        registerButton.setTitle("Register", forState: .Normal)
        registerButton.addTarget(self, action:"RegisterAction", forControlEvents: .TouchUpInside)
        registerButton.titleLabel?.font = UIFont.systemFontOfSize(25)
        self.view.addSubview(registerButton)
        
        
        //取消按钮
        let loginButton = UIButton(type: .System)
        loginButton.frame = CGRectMake(207, 400, 193, 50)
        loginButton.setTitle("Cancel", forState: .Normal)
        loginButton.addTarget(self, action: "CancelAction", forControlEvents: .TouchUpInside)
        loginButton.titleLabel?.font = UIFont.systemFontOfSize(25)
        self.view.addSubview(loginButton)
        
        
    }
    
    //注册响应方法
    func RegisterAction(){
        
        //从用户文件中读取所有的用户
        //这个是用OC中提供的数组,来从文件中读取一个数组
        let array = NSArray(contentsOfFile: userPath) as? [[String:String]]
        var users = [[String:String]]()
        if array != nil {
            //array 不等于空,说明之前存在用户已注册数据
            users.appendContentsOf(array!)  //把数组加进数组的方法
        }
        
        //把输入的内容拿出来.方便后续使用
        let account = accountTextField.text
        let password = passwordTextField.text
        let repassword = repasswordTextField.text
        
        //定义一个变量,来判断当前注册用户是否存在
        var isExist = false //默认不存在
        
        
        //循环数组,判断用户是否存在
        for dict in (users as! [[String:String]]) {
            //先去取得字典中的所有的key
            //因为在存在的时候,是以username作为key,password作为value来存放的
            //所以取出key时,实际上取出的是用户名
            //因为一个字典代表一个用户,所以所有的key也只有唯一一个,就是用户名
            let key = dict.keys.first
            if key == account{
                isExist = true  //如果,某个文件中找到的用户的key和输入的账号一样,说明用户存在
                break  //存在就退出判断,不让注册,不需要重新注册
            }
        }
        
        //判断状态
        if isExist == true{
            //弹出一个警告框,告诉用户已存在
            let alertView = UIAlertView(title: "警告", message: "当前注册用户存在", delegate: nil, cancelButtonTitle: "OK")
            alertView.show()
        }else{
            //如果用户不存在,那么就要将用户保存起来
            
            //判断注册时两次密码输入是否一样
            if password == repassword{
                //到这可以将用户保存起来了
                //现将输入的内容做成字典
                let user:[String:String] = [account!:password!]
                
                //将这个用户加到读取的文件的用户数组里
                users.append(user)
                //将swift数组转成OC数组,方便调用方法写入文件(保证用户注册信息记录成功)
                (users as! NSArray).writeToFile(userPath, atomically: true)
                
                //存完文件后,就可以返回上一页面
                self.dismissViewControllerAnimated(true, completion: nil)
                
            }else{
                //弹出警告框,告诉用户两次输入的密码不同
                let alertView = UIAlertView(title: "警告", message: "两次输入密码不一致", delegate: nil, cancelButtonTitle: "OK")
                alertView.show()
                
            }
        }
        
    }
    
    
    //取消按钮响应方法
    func CancelAction(){
        //取消注册响应,所有操作都无效
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
