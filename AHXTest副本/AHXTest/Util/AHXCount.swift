//
//  AHXCount.swift
//  AHXTest
//
//  Created by qianfeng on 16/9/30.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

    //获取屏幕的宽度
    public let kScreenWidth = UIScreen.mainScreen().bounds.size.width
    //获取屏幕的高度
    public let kScreenHeight = UIScreen.mainScreen().bounds.size.height
    
    // 其中page表示当前页数，count表示每页请求几条数据
    
    // 1.广告
    public let headCellUrl = "http://api.ipadown.com/iphone-client/ad.flash.php?count=5&device=iphone"
    
    // 2.列表
    public let cellUrl = "http://api.ipadown.com/iphone-client/apps.list.php?t=index&count=%ld&page=%ld&device=iPhone&price=all"
    
    
    // 3.今日限免
    public let  todayLimit = "http://api.ipadown.com/iphone-client/apps.list.php?device=iPhone&price=pricedrop&count=20&page=1"
    
    // 4.本周热门限免
    public let weakLimit = "http://api.ipadown.com/iphone-client/apps.list.php?device=iPhone&price=pricedrop&subday=7&orderby=views&count=20&page=1"
    
    // 4.热门限免排行
    public let  hotTop = "http://api.ipadown.com/iphone-client/apps.list.php?device=iPhone&price=pricedrop&orderby=views&count=20&page=1"
    
//分类
//1、分类列表
public let categoryListUrl = "http://api.ipadown.com/iphone-client/category.list.php"

//2、分类进入的具体类型列表
public let categoryUrl = "http://api.ipadown.com/iphone-client/apps.list.php?%@&count=%ld&page=%ld&device=iPhone&price=%@"



//推荐
//1、每日一荐
public let dailyUrl = "http://api.ipadown.com/iphone-client/apps.list.php?t=commend&count=%ld&page=%ld&device=iPhone&price=all"




    
    
