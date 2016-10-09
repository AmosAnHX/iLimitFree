//
//  HomeCell.swift
//  AHXTest
//
//  Created by qianfeng on 16/9/30.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class LimitCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var starLabel: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var sizeLabel: UILabel!
    
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
            
            starLabel.text = "评级:"+model.app_apple_rated!+"星"
        }else {
            starLabel.text = "评级:未知"
        }
        //类别
        if model.app_category != nil {
            
            categoryLabel.text = "类别:"+model.post_stitle!
        }else {
            categoryLabel.text = "类别:未知"
        }
        //下载
        sizeLabel.text = model.app_size
        //详情
        detailLabel.text = model.app_desc
                
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
