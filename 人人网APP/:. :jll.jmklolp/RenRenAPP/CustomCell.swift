//
//  CustomCell.swift
//  RenRenAPP
//
//  Created by KG on 16/9/1.
//  Copyright © 2016年 KG. All rights reserved.
//

import UIKit

class CustomCell: UIImageView {

    init(frame: CGRect ,model:PhotoModel ,target:AnyObject ,action:Selector) {
        super.init(frame: frame)
        
        //开启交互
        self.userInteractionEnabled = true
        
        //设置背背景图片
        let bgImage = UIImage(named: "table_cell_bg")?.stretchableImageWithLeftCapWidth(10, topCapHeight: 10)
        self.image = bgImage
        //设置图片
        let headImage = UIImage(named: "defaultHead")
        let headImageView = UIImageView()
        headImageView.frame = CGRectMake(25, 25, 50, 50)
        headImageView.image = headImage
        self.addSubview(headImageView)
        
        //标题
        let titleLabel = UILabel()
        titleLabel.frame = CGRectMake(90, 20, 200, 30)
        titleLabel.text = model.TITLE!
        self.addSubview(titleLabel)
        
        
        //日期和张数
        let detailLabel = UILabel()
        detailLabel.frame = CGRectMake(90, 50, 200, 30)
        detailLabel.text = "\(model.DATE!) ( \(model.COUNT! )张 )"
        self.addSubview(detailLabel)
        
        
        //手势
        let tap = UITapGestureRecognizer(target: target, action: action)
        self.addGestureRecognizer(tap)

        
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
