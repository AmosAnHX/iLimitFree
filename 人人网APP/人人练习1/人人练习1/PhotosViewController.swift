//
//  PhotosViewController.swift
//  人人练习1
//
//  Created by qianfeng on 16/9/2.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit
class PhotosViewController: BasicViewController {

    var photoList = [PhotoModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parsingData()
        configUI()
    }
    func parsingData(){
        let filePath = NSBundle.mainBundle().pathForResource("data", ofType: "plist")
        let array = NSArray(contentsOfFile:filePath!)
        for dict in array!{
            var model = PhotoModel()
            model.TITLE = dict["TITLE"] as! String
            model.FILENAME = dict["FILENAME"] as! String
            model.DATE = dict["DATE"] as! String
            model.COUNT = String(dict["COUNT"] as! NSNumber)
            print(model)
            
            //将模型对象，加到数组中
            photoList.append(model)
        }
    }
    func configUI(){
        
        //第一个标题label
        let titleLabel = UILabel()
        titleLabel.frame = CGRectMake(0, 0, 414, 50)
        titleLabel.textAlignment = .Center
        titleLabel.font = UIFont.systemFontOfSize(30)
        titleLabel.text = "我的相册 （ 共 \(self.photoList.count) 个）"
        self.view.addSubview(titleLabel)
        for i in 0..<self.photoList.count{
            
            let frame = CGRectMake(0, CGFloat(50+i*100), 414, 100)
            let model = photoList[i]
            let action = NSSelectorFromString("showPhotoList:")
            let customCell = CustomCell(frame: frame, model: model, target: self, action: action)
            //加一个标记值
            customCell.tag = 100 + i
            
            self.view.addSubview(customCell)
        }
    }
    
    //手势的响应方法，用来去弹相册列表
    func showPhotoList(tap:UITapGestureRecognizer){
        
        let photoListVc = photoListViewController()
        
        //这个方法的参数和cell的tag值，都是为了传值做准备
        let index = (tap.view?.tag)! - 100
        //取出模型对象里的文件名
        let fileName = photoList[index].FILENAME
        //传给photoListVc
        photoListVc.fileName = fileName
        //将视图弹出来
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
