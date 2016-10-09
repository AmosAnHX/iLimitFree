//
//  AHXRecommendViewController.swift
//  AHXTest
//
//  Created by qianfeng on 16/9/30.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class AHXRecommendViewController: AHXBaseViewController {

    var pageCtrl : UIPageControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addNaviTitle("精品栏目推荐")
        
        //九宫格
        creatBtns()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
    }
    //九宫格
    func creatBtns(){
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        //创建滚动视图
        let scrollView = UIScrollView(frame: CGRectMake(0, 0, 375, 667-64-49))
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        
        let nameArray = ["每日一荐","本周热门应用","本周热门游戏","上榜精品","GameCenter游戏","装机必备","知名网站客户端","五星好评应用","随便看看","i派党移动版","苹果新闻","iphone4壁纸","用户交流QQ群","i派党移动微博"]
        let imageArray = ["i-commend","i-soft","i-game","i-top","i-gamecenter","i-musthave","i-famous","i-star","i-random","i-ipadown","i-news","i-download","i-qqgroup","i-sinaweibo"]
        
        //循环创建按钮
        let w: CGFloat = 105
        let h: CGFloat = 100
        let spaceX: CGFloat = 10
        let spaceY: CGFloat = 10
        
        for i in 0..<nameArray.count {
            // 页
            let pageIndex = i/12
            let rowAndCol = i%12
            //行
            let row = rowAndCol/3
            let col = rowAndCol%3
    
            let title = nameArray[i]
            let imageName = imageArray[i]
            
            let frame = CGRectMake(20+CGFloat(pageIndex)*375+CGFloat(col)*(w+spaceX)+26, 40+CGFloat(row)*(h+spaceY), 50, 50)
            
            let btn = UIButton.createButton(frame, title: nil, bgImageName: imageName, target: self, action: #selector(clickBtn(_:)))
            btn.tag = 300+i
            scrollView.addSubview(btn)
            
            let labelFrame = CGRectMake(20+CGFloat(pageIndex)*375+CGFloat(col)*(w+spaceX), 40+CGFloat(row)*(h+spaceY)+60, w, 30)
            let label = UILabel.createLabel(labelFrame, title: title, textAlignment: .Center)
            label.font = UIFont.systemFontOfSize(12)
            label.adjustsFontSizeToFitWidth = true
            scrollView.addSubview(label)
            
        }
        
        //一共多少页
        var pageCnt = nameArray.count/12
        if nameArray.count%12 > 0 {
            pageCnt += 1
        }
        scrollView.contentSize = CGSizeMake(375*CGFloat(pageCnt),scrollView.bounds.size.height)
        
        //显示页数
        self.pageCtrl = UIPageControl(frame: CGRectMake(0,510,375,40))
        self.pageCtrl?.numberOfPages = pageCnt
        self.view.addSubview(self.pageCtrl!)
        
    }
    func clickBtn(btn: UIButton){
        
        if btn.tag == 300 {
            let ctrl = DaliyViewController()
            self.navigationController?.pushViewController(ctrl, animated: true)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//MARK: UIScrollView代理
extension AHXRecommendViewController{
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x/scrollView.bounds.size.width)
        
        self.pageCtrl?.currentPage = index
    }
    
}









