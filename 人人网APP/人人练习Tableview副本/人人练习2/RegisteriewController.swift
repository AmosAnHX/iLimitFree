//
//  RegisteriewController.swift
//  人人练习2
//
//  Created by qianfeng on 16/9/2.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class RegisteriewController: ViewController {

    
    @IBOutlet var RegisterViewController: UIView!

    @IBOutlet weak var accountTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var repasswordTextField: UITextField!
    
    
    @IBAction func cancelAction(sender: AnyObject) {
        
        //取消注销响应,所有操作都无效
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func registerAction(sender: AnyObject) {
        
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
                let alertView = UIAlertView(title: "警告", message: "两次输入的密码不一致", delegate: nil, cancelButtonTitle: "Ok")
                alertView.show()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        accountTextField.autocapitalizationType = .None
//        accountTextField.autocorrectionType = .No
//        
//        passwordTextField.autocorrectionType = .No
//        passwordTextField.autocapitalizationType = .None
//        
//        repasswordTextField.autocorrectionType = .No
//        repasswordTextField.autocapitalizationType = .None
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
