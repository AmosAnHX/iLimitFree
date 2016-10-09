//
//  DaliyViewController.swift
//  AHXTest
//
//  Created by Amos on 16/10/6.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class DaliyViewController: AHXBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        //导航
        addNaviTitle("每日一荐")
        
        //下拉刷新上拉加载
        addRefresh()
        
        //返回按钮
        addBackButton()
        
        
    }
    override func downloadData() {
        
        ProgressHUD.showOnView(view)
        
        let urlString = String(format: dailyUrl, self.pageSize!, self.curPage)
        let downloader = MyDownloader()
        downloader.delegate = self
        downloader.downloadeWithURLString(urlString)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
}
//MARK: MyDownloader代理
extension DaliyViewController: MyDownloaderDelegate{
    
    func downloader(downloader: MyDownloader, didFailWitnError error: NSError) {
        
        ProgressHUD.hideAfterFailOnView(view)
    }
    func downloader(downloader: MyDownloader, didFinishWithData data: NSData) {
        if curPage == 1{
            dataArray.removeAllObjects()
        }
        
        //JSON解析
        let result = try! NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
        
        if result.isKindOfClass(NSArray){
            let array = result as! Array<Dictionary<String, AnyObject>>
            
            for homeDict in array{
                //创建模型对象
                let model = HomeModel()
                model.setValuesForKeysWithDictionary(homeDict)
                dataArray.addObject(model)
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

//MARK: UITableView代理
extension DaliyViewController {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "limitCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? LimitCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("LimitCell", owner: nil, options: nil).last as? LimitCell
        }
        //显示数据
        let model = dataArray[indexPath.row] as! HomeModel
        cell?.config(model, atIndex: indexPath.row)
        
        return cell!
    }
}






