//
//  PhotoListViewController.swift
//  RenRenAPP
//
//  Created by KG on 16/9/1.
//  Copyright © 2016年 KG. All rights reserved.
//

import UIKit

class PhotoListViewController: BasicViewController {

    //声明一个属性，用来去接收要显示的文件名
    var fileName : String?
    //
    var images = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //拼接要显示的相册路径
        let filePath = NSHomeDirectory() + "/Documents/Photos/\(fileName!)"
        
        //创建文件管理器对象
        //去读取路径 下文件的内容
        //一般的情况下：创建单例方法都以 defaultXXX , sharedXXX, currentXXX, standardXXX
        let fileManager = NSFileManager.defaultManager()
        
        //利用文件管理器去读取文件的内容 
        //文件管理器在读取内容时，可能会抛出一个异常，
        //在调用这个方法时，要去处理这个异常，或try一下，try! 或try?
       var fileNames = try! fileManager.contentsOfDirectoryAtPath(filePath)
        
        //".DS_Store"
        //将这个非图片文件删除掉
        if fileNames[0] == ".DS_Store"{
            fileNames.removeFirst()
        }
        
        //开始去布局图片
        
        for i in 0..<fileNames.count{
            // 计算行列
            let x = i % 4
            let y = i / 4
            
            //计算frame
            let frame = CGRectMake(CGFloat(3+x*103), CGFloat(5+y*145), 100, 140)
            //准备图片
            //先去拼接图片名
            let imageName = filePath + "/" + fileNames[i]
            let image = UIImage(named: imageName)
            
            
            images.append(image!)
            
            
            
            //创建imageView
            let imageView = UIImageView()
            imageView.frame = frame
            imageView.image = image
            
            imageView.tag = 100 + i
            
            
            
            //还要加个手势
            let tap = UITapGestureRecognizer(target: self, action: "photoDeltailAction:")
            imageView.addGestureRecognizer(tap)
            imageView.userInteractionEnabled = true
            
            self.view.addSubview(imageView)
            
        }
        
    }
    
    func photoDeltailAction(tap:UITapGestureRecognizer){
    
        let photoDetailVC = PhotoDetailViewController()
        
        //利用手势作用的视图，直接获取需要图片
        photoDetailVC.images = images
        photoDetailVC.indexPD = (tap.view?.tag)! - 100
        
        
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
