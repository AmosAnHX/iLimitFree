//
//  PhotosViewController.swift
//  人人网
//
//  Created by qianfeng on 16/9/1.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit


//相册



class PhotosViewController: BasicViewController {
    
    //数组用来装所有相册数据的模型对象
    var photos = [PhotoModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //先解析数据
        parsingData()
        //再布局UI
        configUI()
    }
    
    //解析数据
    func parsingData(){
        //首先将文件中的内容读出来
        //先去获取资源文件的路径
        //在当前程序的资源中去找一个名叫data,类型是plist的文件,返回一个绝对路径
        let filePath = NSBundle.mainBundle().pathForResource("data", ofType: "plist")
        //将文件内容读出来
        let array = NSArray(contentsOfFile: filePath!)
        
        //开始遍历数组
        for dict in array!{
            //要将字典中数据转存到模型对象里,先创建一个模型
            let model = PhotoModel()
            //方法一:利用字典直接给模型对象赋值
            //这个方法的前提:字典中的key要和模型对象中的属性名完全一致!!!!!!!!
//            model.setValuesForKeysWithDictionary(dict as! [String:AnyObject])
//            
            //方法二:一个一个属性去赋值
            model.title = dict["TITLE"] as? String
            model.FILENAME = dict["FILENAME"] as? String
            model.DATE = dict["DATE"] as? String
            model.COUNT = (dict["COUNT"] as! NSNumber)
            
            //将模型对象加到数组中
            photos.append(model)
            
            print(model)
        }
    }
    
    //配置UI
    func configUI(){
        
        //第一个标题label
        let titleLabel = UILabel()
        titleLabel.frame = CGRectMake(0, 0, 414, 50)
        titleLabel.textAlignment = .Center
        titleLabel.font = UIFont.systemFontOfSize(30)
        titleLabel.text = "我的相册 （ 共 \(self.photos.count) 个）"
        self.view.addSubview(titleLabel)

        
        //再布局cell
        //自定义视图
        for i in 0..<self.photos.count{
            let frame = CGRectMake(0, CGFloat(50+i*100), 414, 100)
            let model = photos[i]
            let action = NSSelectorFromString("showPhotoList:")
            let customCell = CustomCell(frame: frame, model: model, target: self, action: action)
            //加一个标记值
            customCell.tag = 100 + i
            
            self.view.addSubview(customCell)
        }
        
    }
    //手势的响应方法,用来去弹相册列表
    func showPhotoList(tap:UITapGestureRecognizer){
        
        let photoListVc = PhotoListViewController()
        //这个方法的参数和cell的tag值,都是为了传值做准备
        let index = (tap.view?.tag)! - 100
        //取出模型对象里的文件名
        let fileName = photos[index].FILENAME
        //传给photoListVc
        photoListVc.fileName = fileName
        //把视图弹出去
        self.navigationController?.pushViewController(photoListVc, animated: true)
        
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
