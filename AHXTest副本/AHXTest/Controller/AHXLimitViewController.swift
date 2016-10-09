//
//  AHXLimitViewController.swift
//  AHXTest
//
//  Created by qianfeng on 16/9/30.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class AHXLimitViewController: AHXBaseViewController {
    
    var selectIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //导航
        createSegmentedControl()
        //上拉刷新下拉加载
        addRefresh()
    }
    //导航
    func createSegmentedControl(){
        let segmentedCtrl = UISegmentedControl(items: ["今日限免","本周热门限免","热门限免总榜"])
        segmentedCtrl.addTarget(self, action: #selector(clickSegCtrl(_:)), forControlEvents: .ValueChanged)
        
        //修改文字颜色
        segmentedCtrl.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.whiteColor()], forState: .Normal)
        segmentedCtrl.selectedSegmentIndex = 0
        
        self.navigationItem.titleView = segmentedCtrl
    }
    func clickSegCtrl(segCtrl: UISegmentedControl){
        
        self.selectIndex = segCtrl.selectedSegmentIndex
        self.curPage = 1
        self.tbView?.contentOffset = CGPointZero
        self.downloadData()
    }
    //下载
    override func downloadData() {
        
        ProgressHUD.showOnView(view)
        var urlString = ""
        if self.selectIndex == 0 {
            urlString = String(format: todayLimit, pageSize!, curPage)
        }else if self.selectIndex == 1 {
            urlString = String(format: weakLimit, pageSize!, curPage)
        }else if self.selectIndex == 2 {
            urlString = String(format: hotTop, pageSize!, curPage)
        }
        
        let downloader = MyDownloader()
        downloader.type = 200
        downloader.delegate = self
        downloader.downloadeWithURLString(urlString)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
extension AHXLimitViewController: MyDownloaderDelegate {
    
    
    func downloader(downloader: MyDownloader, didFailWitnError error: NSError) {
        
        ProgressHUD.hideAfterFailOnView(view)
    }
    func downloader(downloader: MyDownloader, didFinishWithData data: NSData) {
        //        let str = NSString(data: data, encoding: NSUTF8StringEncoding)
        //        print(str!)
        if curPage == 1 {
            dataArray.removeAllObjects()
        }
        let result = try! NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
        if result.isKindOfClass(NSArray) {
            let array = result as! Array<Dictionary<String,AnyObject>>
            for dict in array {
                let model = HomeModel()
                model.setValuesForKeysWithDictionary(dict)
                dataArray.addObject(model)
                
            }
            dispatch_async(dispatch_get_main_queue(), {
                
                self.tbView!.reloadData()
                self.tbView?.headerView?.endRefreshing()
                self.tbView?.footerView?.endRefreshing()
                ProgressHUD.hideAfterSuccessOnView(self.view)
            })
        }
    }
    
}
//MARK: UITableView代理
extension AHXLimitViewController {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellId = "limitCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? LimitCell
        if nil == cell {
            cell = NSBundle.mainBundle().loadNibNamed("LimitCell", owner: nil, options: nil).last as? LimitCell
        }
        
        cell?.selectionStyle = .None
        
        let model = dataArray[indexPath.row] as! HomeModel
        cell?.config(model, atIndex: indexPath.row+1)
        return cell!
        
        
    }
}
