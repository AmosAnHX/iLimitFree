//
//  RRRegisterViewController.swift
//  RenRenAPP
//
//  Created by KG on 16/8/31.
//  Copyright © 2016年 KG. All rights reserved.
//

import UIKit
//全局变量，用来去保存用户存放的路径
public let userPath = NSHomeDirectory() + "/Documents/users.plist"

class RRRegisterViewController: ViewController {

    
    //有三个输入框
    let accountTextField = UITextField()    //帐号
    let passwordTextField = UITextField()   //密码
    let repasswordTextField = UITextField() //重复密码
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        //提示label
        let titleLabel = UILabel()
        titleLabel.frame = CGRectMake(7, 100, 400, 50)
        titleLabel.text = "请输入注册信息"
        titleLabel.textAlignment = .Center
        titleLabel.font = UIFont.systemFontOfSize(30)
        self.view.addSubview(titleLabel)
        
       
        //帐号
        accountTextField.frame = CGRectMake(7, 200, 400, 50)
        accountTextField.font = UIFont.systemFontOfSize(30)
        accountTextField.placeholder = "请输入注册帐号/邮箱/手机号"
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
        repasswordTextField.placeholder = "请再次输入密码"
        repasswordTextField.autocapitalizationType = .None
        repasswordTextField.autocorrectionType = .No
        repasswordTextField.borderStyle = .RoundedRect
        repasswordTextField.clearButtonMode = .Always
        repasswordTextField.clearsOnBeginEditing = true
        repasswordTextField.secureTextEntry = true
        self.view.addSubview(repasswordTextField)
        
        
        //按钮
        //注册
        let registerButton = UIButton(type: .System)
        registerButton.frame = CGRectMake(7, 400, 193, 50)
        registerButton.setTitle("Cancel", forState: .Normal)
        registerButton.addTarget(self, action: "cancelAction", forControlEvents: .TouchUpInside)
        registerButton.titleLabel?.font = UIFont.systemFontOfSize(25)
        self.view.addSubview(registerButton)
        
        
        //登陆按钮
        let loginButton = UIButton(type: .System)
        loginButton.frame = CGRectMake(207, 400, 193, 50)
        loginButton.setTitle("Register", forState: .Normal)
        loginButton.addTarget(self, action: "registerAction", forControlEvents: .TouchUpInside)
        loginButton.titleLabel?.font = UIFont.systemFontOfSize(25)
        self.view.addSubview(loginButton)
        
    }
    
    //注册响应方法
    func registerAction(){
        
        //从用户文件中去读取所有的用户
        //这个是用OC中提供的数组来从文件中去读取一个数组
        let array = NSArray(contentsOfFile: userPath) as? [[String:String]]
        var users = [[String:String]]()
        if array != nil{
            //array 不等于空，说明原来有用户
            users.appendContentsOf(array!)
        }
        
        //把输入的内容，都拿出来，方便后面使用
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
        
        
        //定义一个变量，来记录当前注册用户是否存在
        var isExist = false  //默认是不存在
        
        //循环数组，来判断用户是否存在
        for dict in users {
            
            //先去取得字典中的所有的key,
            //因为在存的的时候，是以 username做为key,password做为value来存放的
            //所以取出key时，实际取出的就是用户名
            //因为一个字典代表一个用户，所以所有的key也只有一个，就是用户名
            let key  = dict.keys.first
            if key == account {
                isExist = true//如果某个用户的key 和 输入的帐号一样，说明用户存在
                break//存在就退出判断，不让注册
            }
        }
        
        //判断状态
        if isExist == true{
            //弹一个警告框 告诉用户帐号不可用
            let alertView = UIAlertView(title: "警告", message: "当前注册用户已存在", delegate: nil, cancelButtonTitle: "OK")
            alertView.show()
        }else{
            //如果用户不存在，那么就要将用户保存起来
            //判断两次密码输入是否一样
            if password == repassword{
                //到这就可以将用户保存起来
                //先将输入的内容，做成一个字典
                let user:[String:String] = [account!:password!]
                
                //将这个用户加到读取出来的用户数组里
                users.append(user)
                //将swift数组转成 OC 数组，方便调用方法写入文件
                (users as! NSArray).writeToFile(userPath, atomically: true)
                
            
                
                // 存完文件后，就可以去返回上一页面
                self.dismissViewControllerAnimated(true, completion: nil)
                
            }else{
                //弹一个警告框 告诉用户帐号不可用
                let alertView = UIAlertView(title: "警告", message: "两次密码输入不一致", delegate: nil, cancelButtonTitle: "OK")
                alertView.show()
            }
  
        
        }
        

        
    }
    //取消响应方法
    func cancelAction(){
        
        //取消没有注册，那么所有操作都无效
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
