//
//  CustomCell.swift
//  人人练习2
//
//  Created by qianfeng on 16/9/2.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

//封装一个自定义的相册列表类

class CustomCell: UIImageView {

    init(frame: CGRect,model:PhotoModel,target:AnyObject,action:Selector) {
        super.init(frame: frame)
        //打开用户交互
        self.userInteractionEnabled = true
        
        //子相册的背景图片
        let bgImage = UIImage(named: "table_cell_bg")?.stretchableImageWithLeftCapWidth(10, topCapHeight: 10)
        self.image = bgImage
        let headImage = UIImage(named: "defaultHead")
        let headImageView = UIImageView()
        headImageView.frame = CGRectMake(25, 25, 50, 50)
        headImageView.image = headImage
        self.addSubview(headImageView)
        
        //子相册的标题
        let titlelabel = UILabel()
        titlelabel.frame = CGRectMake(90, 20, 200, 30)
        titlelabel.text = model.TITLE
        self.addSubview(titlelabel)
        
        //子相册上面显示的日期和张数
        let detailLabel = UILabel()
        detailLabel.frame = CGRectMake(90, 50, 200, 30)
        detailLabel.text = "\(model.DATE!) (\(model.COUNT! )张)"
        self.addSubview(detailLabel)
        
        
        //点开子相册的手势
        let tap = UITapGestureRecognizer(target: target, action: action)
        self.addGestureRecognizer(tap)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
