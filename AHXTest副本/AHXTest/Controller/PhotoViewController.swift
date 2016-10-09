//
//  PhotoViewController.swift
//  AHXTest
//
//  Created by qianfeng on 16/10/7.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class PhotoViewController: AHXBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //导航
        addNaviTitle("二维码扫描")
        addBackButton()
        
        createImageView()
        createLabel()
        createBtn()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        
    }
    //二维码
    func createImageView(){
        
        let imageView = UIImageView(frame: CGRectMake(110, 50, 150, 150))
        imageView.image = UIImage(named:"qrcode")
        view.addSubview(imageView)
        
    }
    func createLabel(){
        
        self.createLabel(CGRectMake(10, 230, 355, 40), text: "拿起您的iPhone,摄像头对准i派党等网站的二维码~咔嚓一下即可哦~")
        self.createLabel(CGRectMake(10, 290, 355, 100), text: "i派党是一个专业介绍精品,限时免费Apps的网站,每日更新,为用户推荐最好玩,最实用的Apps.其中大部分软件游戏都附有精准的评测分析.全部中文介绍,iTunes内部下载.地址是www.ipadown.com")
        self.createLabel(CGRectMake(10, 410, 355, 40), text: "本条码扫描同样支持扫描国内各大App网站的条码哦~赶快去体验一下吧~")
    }
    private func createLabel(frame: CGRect,text: String){
        
        let label = UILabel(frame: frame)
        label.textColor = UIColor.blackColor()
        label.font = UIFont.systemFontOfSize(18)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .Left
        label.text = text
        view.addSubview(label)
    }
    func createBtn(){
        let btn = UIButton(frame: CGRectMake(375/2-40,470, 80, 30))
        btn.setBackgroundImage(UIImage(named:"price-bg"), forState: .Normal)
        btn.setTitle("开始扫描", forState: .Normal)
        btn.addTarget(self, action: #selector(selectAction), forControlEvents: .TouchUpInside)
        view.addSubview(btn)
    }
    func selectAction(){}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
