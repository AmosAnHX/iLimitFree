//
//  CateListViewController.swift
//  AHXTest
//
//  Created by qianfeng on 16/10/6.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class CateListViewController: AHXBaseViewController {


    //查询条件
    var categoryStr: String?
    var cateName: String?
    
    //筛选按钮
    var chooseBtn: UIButton?
    
    //选中的序号
    var selectIndex: Int = 0
    var segmentCtrl: UISegmentedControl?
    
    //筛选的视图
    var maskView: UIView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //导航
        self.addNaviTitle(self.cateName!)
        self.addBackButton()
        
        //下拉刷新上拉加载
        addRefresh()
        
        //选择条件
        self.chooseBtn = self.addNaviButton("全部", target: self, action: #selector(clickAction), isLeft: false)
        
        
    }
    func clickAction(){
        if chooseBtn?.currentTitle == "取消" {
            self.segmentCtrl?.removeFromSuperview()
            self.segmentCtrl = nil
            
            self.maskView?.removeFromSuperview()
            self.maskView = nil
            
            //修改按钮文字
            self.chooseBtn?.setTitle(segmentCtrl?.titleForSegmentAtIndex(self.selectIndex), forState: .Normal)
        }else{
            //显示筛选界面
            self.maskView = UIView(frame: CGRectMake(0,0,375,667-49))//-64
            self.maskView?.backgroundColor = UIColor.blackColor()
            self.maskView?.alpha = 0.8
            self.view.addSubview(maskView!)
            
            //选择控件
            self.segmentCtrl = UISegmentedControl(items: ["全部","免费","限免","付费"])
            self.segmentCtrl?.frame = CGRectMake(50, 80, 280, 44)
            
            //文字
            self.segmentCtrl?.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.whiteColor()], forState: .Normal)
            
            //事件
            self.segmentCtrl?.addTarget(self, action: #selector(selectAct(_:)), forControlEvents: .ValueChanged)
            
            //显示上次选中的序号
            self.segmentCtrl?.selectedSegmentIndex = self.selectIndex
            self.view.addSubview(self.segmentCtrl!)
            
            self.chooseBtn?.setTitle("取消", forState: .Normal)
        }
    }
    func selectAct(segCtrl: UISegmentedControl) {
        
        //下载数据
        self.selectIndex = segCtrl.selectedSegmentIndex
        
        self.curPage = 1
        
        self.downloadData()
        
        //修改按钮文字
        let title = segCtrl.titleForSegmentAtIndex(self.selectIndex)
        self.chooseBtn?.setTitle(title, forState: .Normal)
        
        self.tbView?.contentOffset = CGPointZero
        
        //视图隐藏
        self.segmentCtrl?.removeFromSuperview()
        self.maskView?.removeFromSuperview()
        
        
    }

    //下载
    override func downloadData() {
        
        ProgressHUD.showOnView(self.view)
        
        var price = ""
        if self.selectIndex == 0 {
            price = "all"
        }else if self.selectIndex == 1 {
            price = "free"
        }else if self.selectIndex == 2 {
            price = "pricedrop"
        }else if self.selectIndex == 3 {
            price = "paid"
        }
        
        let urlString = String(format: categoryUrl , self.categoryStr!, self.pageSize!, self.curPage, price)
        let downloader = MyDownloader()
        downloader.delegate = self
        downloader.downloadeWithURLString(urlString)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
//MARK: downloade代理
extension CateListViewController: MyDownloaderDelegate{
    
    func downloader(downloader: MyDownloader, didFailWitnError error: NSError) {
        ProgressHUD.hideAfterFailOnView(self.view)
    }
    
    func downloader(downloader: MyDownloader, didFinishWithData data: NSData) {
        
        if curPage == 1 {
            self.dataArray.removeAllObjects()
        }
        
        //JSON解析
        let result = try! NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
        if result.isKindOfClass(NSArray){
            let array = result as! Array<Dictionary<String, AnyObject>>
            
            for homeDict in array {
                //创建模型对象
                let model = HomeModel()
                model.setValuesForKeysWithDictionary(homeDict)
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
//MARK: UiTableView代理
extension CateListViewController{
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellId = "homeCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? HomeCell
        
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("HomeCell", owner: nil, options: nil).last as? HomeCell
        }
        let model = dataArray[indexPath.row] as! HomeModel
        cell?.config(model, atIndex: indexPath.row)
        
        return cell!
    }
}






