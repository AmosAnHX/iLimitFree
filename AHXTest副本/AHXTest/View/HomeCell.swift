//
//  HomeCell.swift
//  AHXTest
//
//  Created by qianfeng on 16/9/30.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var starLabel: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var sizeLabel: UILabel!
    
    @IBOutlet weak var reduceLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    func config(model: HomeModel,atIndex index: Int){
        
        //头像
        let url = NSURL(string: model.app_icon!)
        userImageView.kf_setImageWithURL(url, placeholderImage: UIImage(named: "placeholder"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
        //名字
        if model.post_stitle != "" {
            nameLabel.text = "\(index+1).[\(model.post_stitle!)]"+" "+model.app_name!
        }else{
            nameLabel.text = "\(index+1).\(model.app_name!)"
        }
        //星级
        if model.app_apple_rated != nil {
            let rate = Float(model.app_apple_rated!)
            starLabel.text = "评级:\(rate!)星"
        }else {
            starLabel.text = "评级:未知"
        }
        //类别
        categoryLabel.text = "类别:\(model.app_category!)"
        //下载
        sizeLabel.text = model.app_size
        //详情
        detailLabel.text = model.app_desc
        //状态
        
        if Int(model.app_pricedrop!)! == 1 {
            //降价或限免
            reduceLabel.backgroundColor = UIColor(red: 50.0/255.0, green: 120.0/255.0, blue: 200.0/255.0, alpha: 1.0)
            reduceLabel.layer.cornerRadius = 8
            reduceLabel.clipsToBounds = true
            reduceLabel.textColor = UIColor.whiteColor()
            
            if Float(model.app_price!)! > 0 {
                reduceLabel.textAlignment = .Center
                reduceLabel.text = "降价中"
            }else{
                reduceLabel.textAlignment = .Center
                reduceLabel.text = "限免中"
            }
            
        }else if Int(model.app_pricedrop!) == 0 {
            //原价
            reduceLabel.backgroundColor = UIColor(red: 50.0/255.0, green: 70.0/255.0, blue: 120.0/255.0, alpha: 1.0)
            reduceLabel.layer.cornerRadius = 8
            reduceLabel.clipsToBounds = true
            reduceLabel.textColor = UIColor.whiteColor()
            
            if Float(model.app_price!) > 0 {
                reduceLabel.textAlignment = .Center
                reduceLabel.text = "\(model.app_price!)元"
            }else{
                reduceLabel.textAlignment = .Center
                reduceLabel.text = "免费"
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
