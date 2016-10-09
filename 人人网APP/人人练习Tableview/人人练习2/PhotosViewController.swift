//
//  PhotosViewController.swift
//  人人练习2
//
//  Created by qianfeng on 16/9/2.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit


//showPhototList
//相册视图

class PhotosViewController: BasicViewController {

    //数组用来装所有相册数据的模型对象
    //可变的数组类型,并且初始化
    var photos : NSMutableArray = NSMutableArray()
    
    //
//    var photos = [PhotoModel]()
    
    var tableView : UITableView?
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //用来调方法
        //先解析数据
        parsingData()
        //再布局UI
        configUI()
    }
    //解析数据
    func parsingData(){
        //首先将文件中的内容读出来
        let filePath = NSBundle.mainBundle().pathForResource("data", ofType: "plist")
        //将文件读出来
        let array = NSArray(contentsOfFile: filePath!)
        print(array)
        
        
        //开始遍历数组
        for dict in array!{
            //要将字典中数据转存到模型对象里
            var model = PhotoModel()
            model.TITLE = dict["TITLE"] as! String
            model.FILENAME = dict["FILENAME"] as! String
            model.DATE = dict["DATE"] as! String
            model.COUNT = (dict["COUNT"] as! NSNumber)
            
            photos.addObject(model)
            //dataSource.append(model)
           
        }
    }
    //配置UI
    func configUI(){
        //第一个标题label
        let titleLabel = UILabel()
        titleLabel.frame = CGRectMake(0, 64, 414, 50)
        titleLabel.textAlignment = .Center
        titleLabel.font = UIFont.systemFontOfSize(30)
        titleLabel.text = "我的相册 (共\(self.photos.count)个)"
        self.view.addSubview(titleLabel)
        
        //布局cell
        tableView = UITableView(frame: CGRectMake(0, 124, 414, 600), style: .Plain)
        self.view.addSubview(tableView!)
        tableView?.backgroundColor = UIColor.clearColor()
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.rowHeight = 100
        
   
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension PhotosViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count  //3
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("xx")
        if cell == nil{
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "xx")
            
        }
        let model = photos[indexPath.row] as! PhotoModel
        cell?.textLabel?.font = UIFont.systemFontOfSize(25)
        cell?.textLabel?.text = model.TITLE
        
        
        let data = "\(model.DATE!)  (\(model.COUNT!)张)"
        cell?.detailTextLabel?.font = UIFont.systemFontOfSize(25)
        cell?.detailTextLabel?.text = data
      
        let bgImage = UIImage(named: "defaultHead")
        cell?.imageView?.image = bgImage
        
        
        return cell!
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let photoListVc = PhotoListViewController()
        let model = photos[indexPath.row] as! PhotoModel
        photoListVc.fileName = model.FILENAME
        self.navigationController?.pushViewController(photoListVc, animated: true)
    }
}






















