//
//  AHXBaseViewController.swift
//  AHXTest
//
//  Created by qianfeng on 16/9/30.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class AHXBaseViewController: AHXNavigationViewController, UITableViewDelegate, UITableViewDataSource {

    
    //表格
    var tbView: UITableView?
    
    //数据源数组
    lazy var dataArray = NSMutableArray()
    
    //当前页数
    var curPage: Int = 1
    //页面尺寸
    var pageSize: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //表格
        self.createTableView()
        
        //下载
        self.curPage = 1
        self.pageSize = 20
        self.downloadData()
        
    }
    
    //创建表格
    func createTableView() {
//        automaticallyAdjustsScrollViewInsets = false
        tbView = UITableView(frame: CGRectMake(0, 0, kScreenWidth, kScreenHeight-49), style: .Plain)
        
        tbView?.delegate = self
        tbView?.dataSource = self
        view.addSubview(tbView!)
        
    }
    //下载数据
    func downloadData(){}
    //刷新
    func refreshHeader(){}
    
    //分页的功能
    func addRefresh() {
        //下拉刷新
        if tbView?.headerView == nil {
            tbView?.headerView = XWRefreshNormalHeader(target: self, action: #selector(loadFirstPage))
            
        }
        //上拉加载更多
        if tbView?.footerView == nil {
            tbView?.footerView = XWRefreshAutoNormalFooter(target: self, action: #selector(loadNextPage))
        }
    }
    //下拉刷新响应方法
    func loadFirstPage(){
        
        curPage = 1
        
        downloadData()
        //重新刷新
        refreshHeader()
        
    }
    
    //上拉加载更多
    func loadNextPage(){
        
        curPage += 1
        downloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK: UITableView代理
extension AHXBaseViewController {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}

