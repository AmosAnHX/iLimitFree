//
//  PhotoListViewController.swift
//  人人练习2
//
//  Created by qianfeng on 16/9/3.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit


//显示照片缩略图的视图

class PhotoListViewController: BasicViewController {

    //声明一个属性,用来去接收要显示的文件名
    var fileName : String?
    
    
    
    var images = [UIImage]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //拼接要显示的相册途径
        let filePath = NSHomeDirectory() + "/Documents/Photos/\(fileName!)"
        //创建文件管理对象
        //去读取路径下的文件内容
        //一般的情况下,创造单例都以defaultxxx,sharedxxx,currentxxx
        let fileManager = NSFileManager.defaultManager()
        
        //文件管理器在读取内容时会抛出异常
        //在调用这个方法时,要去处理这个异常 try!
        var fileNames = try! fileManager.contentsOfDirectoryAtPath(filePath)
        
        
        //将文件的"DS_Store"去掉
        if fileNames[0] == ".DS_Store"{
            fileNames.removeFirst()
        }
        
        print("Amos\(fileNames)")

        //开始布局图片
        for i in 0..<fileNames.count{
            //计算行列
            let x = i % 4
            let y = i / 4
            //计算frame
            let frame = CGRectMake(CGFloat(3+x*103), CGFloat(70+y*145), 100, 140)
            //准备图片
            //拼接图片名
            let imageName = filePath + "/" + fileNames[i]
            //完整路径
            let image = UIImage(named: imageName)
            
            //
            images.append(image!)
            
            
            //创建imageView
            let imageView = UIImageView()
            imageView.frame = frame
            imageView.image = image
            
            imageView.tag = 100 + i
            
            
            
            //加手势
            let tap = UITapGestureRecognizer(target: self, action: "photoDeltailAction:")
            imageView.addGestureRecognizer(tap)
            imageView.userInteractionEnabled = true
            
            self.view.addSubview(imageView)
        }
    }
    //手势响应方法
    func photoDeltailAction(tap:UITapGestureRecognizer){
        let photoDetailVC = PhotoDetailViewController()
        //使用手势作用的视图直接获取需要的图片
        //let tapImageView = tap.view as! UIImageView
        
        //给下一页面赋值
        //将手势作用的图片赋值给新的视图放大
        //photoDetailVC.photoDetailImageView.image = tapImageView.image
        
        photoDetailVC.indexCZ = (tap.view?.tag)! - 100

        photoDetailVC.images = images
        
        self.navigationController?.pushViewController(photoDetailVC, animated: true)
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
