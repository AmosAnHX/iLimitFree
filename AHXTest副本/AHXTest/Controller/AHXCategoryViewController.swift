//
//  AHXCategoryViewController.swift
//  AHXTest
//
//  Created by qianfeng on 16/9/30.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class AHXCategoryViewController: AHXBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //标题
        self.addNaviTitle("按分类筛选")
        //表格
        createTableView()
        //下载
        downloadData()
        
    }
    //下载
    override func downloadData() {
        ProgressHUD.showOnView(self.view)
        let urlString = categoryListUrl
        
        let downloader = MyDownloader()
        downloader.type = 200
        downloader.delegate = self
        
        downloader.downloadeWithURLString(urlString)
        
    }
    //刷新UI
    func refreshUI(){
        self.tbView?.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
//MARK: MyDownloader代理
extension AHXCategoryViewController: MyDownloaderDelegate{
    
    func downloader(downloader: MyDownloader, didFailWitnError error: NSError) {
        ProgressHUD.hideAfterFailOnView(self.view)
    }
    func downloader(downloader: MyDownloader, didFinishWithData data: NSData) {
        
        //JSON解析
        let result = try! NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
        let string = NSString(data: data, encoding: NSUTF8StringEncoding)
        //print("Amos:\(string!)")
        
        if result.isKindOfClass(NSArray) {
            let array = result as! Array<Dictionary<String, AnyObject>>
            
            for cateDict in array {
                //模型对象
                let model = CategoryModel()
                model.setValuesForKeysWithDictionary(cateDict)
                
                
                let listArray = cateDict["list"] as! Array<Dictionary<String, AnyObject>>
                let typeArray = NSMutableArray()
                for listDict in listArray {
                    let typeModel = CategoryType()
                    typeModel.setValuesForKeysWithDictionary(listDict)
                    typeArray.addObject(typeModel)
                }
                model.typeArray = typeArray
                
                self.dataArray.addObject(model)
            }
            dispatch_async(dispatch_get_main_queue(), { 
                self.tbView?.reloadData()
                
                self.tbView?.headerView?.endRefreshing()
                self.tbView?.footerView?.endRefreshing()
                
                ProgressHUD.hideAfterSuccessOnView(self.view)
            })
        }
    }
}

//MARK:UITableview代理
extension AHXCategoryViewController {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return dataArray.count
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let model = self.dataArray[section] as! CategoryModel
        return (model.typeArray?.count)!
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "categoryCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? CategoryCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("CategoryCell", owner: nil, options: nil).last as? CategoryCell
        }
        let model = self.dataArray[indexPath.section] as! CategoryModel
        let typeModel = model.typeArray![indexPath.row] as! CategoryType
        
        cell?.config(typeModel)
        
        return cell!
        
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let model = self.dataArray[section] as! CategoryModel
        return model.header
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {  
        
        let model = self.dataArray[indexPath.section] as! CategoryModel
        let typeModel = model.typeArray![indexPath.row] as! CategoryType
        
        let listCtrl = CateListViewController()
        
        listCtrl.categoryStr = typeModel.querystr
        listCtrl.cateName = typeModel.title
        
        self.navigationController?.pushViewController(listCtrl, animated: true)
    }
}










