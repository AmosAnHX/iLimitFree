//
//  RRLoginViewController.swift
//  人人网
//
//  Created by qianfeng on 16/8/31.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit


//登录界面


class RRLoginViewController: ViewController {

    //将输入框作为成员属性,方便后续使用
    let accountTextField = UITextField()//账号
    let passwordTextField = UITextField()//密码
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //进行布局UI
        //LOGO
        let logoImageView = UIImageView()
        logoImageView.frame = CGRectMake(414/2-114/2, 100, 114, 114)
        logoImageView.image = UIImage(named: "Icon")
        self.view.addSubview(logoImageView)
        
        //配置账号和密码
        //账号
        accountTextField.frame = CGRectMake(7, 250, 400, 50)
        accountTextField.font = UIFont.systemFontOfSize(30)
        accountTextField.placeholder = "请输入账号/邮箱/手机号" //添加水印提示文字
        accountTextField.autocapitalizationType = .None   // 自动大小写
        accountTextField.autocorrectionType = .No     // 自动纠错
        accountTextField.borderStyle = .RoundedRect  //输入框为圆角矩形
        accountTextField.clearButtonMode = .Always  //清除按钮
        accountTextField.clearsOnBeginEditing = true  //再次输入时 是否清除
        
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
        
        self.view.addSubview(passwordTextField)
        
        //默认账号
        accountTextField.text = "1"
        passwordTextField.text = "1"
        
        
        
        
        //按钮
        //注册
        let registerButton = UIButton(type: .System)
        registerButton.frame = CGRectMake(7, 400, 193, 50)
        registerButton.setTitle("Register", forState: .Normal)
        registerButton.addTarget(self, action:"RegisterAction", forControlEvents: .TouchUpInside)
        registerButton.titleLabel?.font = UIFont.systemFontOfSize(25)
        self.view.addSubview(registerButton)
        
        
        //登录
        let loginButton = UIButton(type: .System)
        loginButton.frame = CGRectMake(207, 400, 193, 50)
        loginButton.setTitle("Login", forState: .Normal)
        loginButton.addTarget(self, action: "LoginAction", forControlEvents: .TouchUpInside)
        loginButton.titleLabel?.font = UIFont.systemFontOfSize(25)
        self.view.addSubview(loginButton)
        
        
    }
    
    //注册响应方法
    func RegisterAction(){
        
        //弹出注册页面
        let registerVC = RRRegisterViewController()
        registerVC.modalTransitionStyle = .FlipHorizontal   //页面跳转为水平翻转
        self.presentViewController(registerVC, animated: true, completion: nil)
    }
    
    
    //登录响应方法
    func LoginAction(){
        
        //首先读取用户文件中的所有用户   
        //将读取的OC文件转换为swift的字典类型
        let array = NSArray(contentsOfFile: userPath) as? [[String:String]]
        //创建一个swift数组  
        //初始化元素为字典的数组
        var users = [[String:String]]()
        
        //判断,如果array不为空,说明原来存在已注册用户,那么将这些用户加到users
        if array != nil{
            users.appendContentsOf(array!)
        }
        
        //取出输入的值
        let account = accountTextField.text
        let password = passwordTextField.text
        
        //加一个状态标记,用来记录用户是否存在的
        var isExist = false
        
        //再加一个状态标记,用来记录字典保存的密码和输入的密码是否一致
        var isSamepassword = true //默认两次密码一样
        
        
        //遍历这个数组里的字典元素,判断用户是否存在
        for dict in users {
            //取出用户字典中的用户名和密码
            //因为每一个字典都是唯一的,字典的key表示用户名userName,取出一个字典的key就是取出用户的用户名
            let userName = dict.keys.first
            let pw = dict[userName!]      //密码   value = dictionary[key]
            
            
            //判断
            if account == userName{
                //如果用户名存在,就继续判断密码
                if pw == password{
                    //密码匹配成功,就退出循环
                    isExist = true
                    break
                }else {
                    //当密码不正确,弹出警告框
                    let alerView = UIAlertView(title: "警告", message: "密码不正确", delegate: nil, cancelButtonTitle: "OK")
                    alerView.show()
                    
                    isSamepassword = false //记录两次密码不一样
                }
            }
        }
        
        if isExist == true{
            //如果登陆成功,弹出首页
            let homeVC = RRHomeViewController()
            //在这要将首页加到导航控制器上
            let nvc = UINavigationController(rootViewController: homeVC)
            //将导航控制器弹出来
            self.presentViewController(nvc, animated: true, completion: nil)

        }else{
            //输入用户不存在
            //弹出警告框
            let alerView = UIAlertView(title: "+警告", message: "输入账号不存在", delegate: nil, cancelButtonTitle: "OK")
            //为了消除弹出的"密码不正确"警告框这个bug,让isSamepassword == true 时展示alerView
            if isSamepassword == true{    //两次密码一样
                alerView.show()
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
