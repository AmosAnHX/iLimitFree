//
//  AHXHomeViewController.swift
//  AHXTest
//
//  Created by qianfeng on 16/9/30.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class AHXHomeViewController: AHXBaseViewController,MyDownloaderDelegate {

    //广告滚动视图的数据
    lazy var ScrollViewDataArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //导航
        createNavi()
        
        //上拉刷新和下拉加载
        addRefresh()
        
        //下载广告滚动视图的数据
        downloadScrollViewData()
        
    }
    //下载滚动视图的数据
    func downloadScrollViewData(){
        
        let urlString = headCellUrl
        let downloader = MyDownloader()
        downloader.type = 200
        downloader.delegate = self
        
        downloader.downloadeWithURLString(urlString)
        
    }
    //下载列表数据
    override func downloadData() {
        
        ProgressHUD.showOnView(view)
        let urlString = String(format: cellUrl, self.pageSize!, self.curPage)
        
        let downloader = MyDownloader()
        downloader.type = 100
        downloader.delegate = self
        downloader.downloadeWithURLString(urlString)
        
    }
    //下拉刷新时同时刷新头视图的滚动视图内容
    override func refreshHeader() {
        if ScrollViewDataArray.count > 0 {
            self.ScrollViewDataArray.removeAllObjects()//???????????
            self.downloadScrollViewData()
        }
    }
    
    func createNavi(){
        let leftItem = UIBarButtonItem(barButtonSystemItem: .Camera, target: self, action: #selector(leftAction))
        let rightItem = UIBarButtonItem(barButtonSystemItem: .Refresh, target: self, action: #selector(rightAction))
        
        self.navigationItem.leftBarButtonItem = leftItem
        self.navigationItem.rightBarButtonItem = rightItem
        
        addNaviTitle("精品限时免费")
        
    }
    //退出二维码页面
    func leftAction(){
        
        let photoCtrl = PhotoViewController()
        hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(photoCtrl, animated: true)
        hidesBottomBarWhenPushed = false
    
    }
    func rightAction(){
    
        dataArray.removeAllObjects()
        ScrollViewDataArray.removeAllObjects()
        
        downloadData()
        downloadScrollViewData()
        ProgressHUD.hideAfterSuccessOnView(self.view)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
extension AHXHomeViewController {
 
    
    func downloader(downloader: MyDownloader, didFailWitnError error: NSError) {
        if downloader.type == 200 {
            ProgressHUD.hideAfterFailOnView(view)

        }
    }
    func downloader(downloader: MyDownloader, didFinishWithData data: NSData) {
//        let str = NSString(data: data, encoding: NSUTF8StringEncoding)
//        print(str!)
        if downloader.type == 100 {
            if curPage == 1 {
                dataArray.removeAllObjects()
            }
            
            //解析JSON数据
            let result = try! NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
            if result.isKindOfClass(NSArray) {
                let array = result as! Array<Dictionary<String,AnyObject>>
                for dict in array {
                    let model = HomeModel()
                    model.setValuesForKeysWithDictionary(dict)
                    dataArray.addObject(model)
                    //print(dataArray)
                    
                }
                dispatch_async(dispatch_get_main_queue(), {
                    self.tbView!.reloadData()
                    
                    self.tbView?.headerView?.endRefreshing()
                    self.tbView?.footerView?.endRefreshing()
                    
                    ProgressHUD.hideAfterSuccessOnView(self.view)
                })
            }
        }else if downloader.type == 200 {
            
            //解析数据
            let result = try! NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
            if result.isKindOfClass(NSArray) {
                let array = result as! Array<Dictionary<String,AnyObject>>
                for dict in array {
                    //创建模型
                    let model = ScrollViewModel()
                    model.setValuesForKeysWithDictionary(dict)
                    ScrollViewDataArray.addObject(model)
                    
                }
                dispatch_async(dispatch_get_main_queue(), {
                    self.tbView?.reloadData()
                    
                    self.tbView?.headerView?.endRefreshing()
                    self.tbView?.footerView?.endRefreshing()
                    
                })
            }
        }
    }
}
extension AHXHomeViewController {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var num = self.dataArray.count
        if self.ScrollViewDataArray.count > 0 {
            num += 1
        }
        return num
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        var height: CGFloat = 0
        if self.ScrollViewDataArray.count > 0 {
            if indexPath.row == 0 {
                height = 160
            }else{
                height = 110
            }
        }else {
            height = 110
        }
        return height
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if self.ScrollViewDataArray.count > 0 {
            if indexPath.row == 0 {
                //广告
                let cellId = "scrollViewCellId"
                var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? ScrollViewCell
                if cell == nil {
                    cell = NSBundle.mainBundle().loadNibNamed("ScrollViewCell", owner: nil, options: nil).last as? ScrollViewCell
                }
                cell?.dataArray = self.ScrollViewDataArray
                return cell!
            }else{
                let cellId = "homeCellId"
                var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? HomeCell
                if cell == nil {
                    cell = NSBundle.mainBundle().loadNibNamed("HomeCell", owner: nil, options: nil).last as? HomeCell
                }
                let model = self.dataArray[indexPath.row-1] as! HomeModel
                cell?.config(model, atIndex: indexPath.row-1)
                
                return cell!
                
            }
        }else {
            
            //列表
            let cellId = "homeCellId"
            var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? HomeCell
            if nil == cell {
                cell = NSBundle.mainBundle().loadNibNamed("HomeCell", owner: nil, options: nil).last as? HomeCell
            }
            
            cell?.selectionStyle = .None
            
            let model = dataArray[indexPath.row] as! HomeModel
            cell?.config(model, atIndex: indexPath.row)
            return cell!
        }
    }
}

