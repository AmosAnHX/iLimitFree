//
//  CategoryCell.swift
//  AHXTest
//
//  Created by qianfeng on 16/10/6.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var headerImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    func config(type: CategoryType){
        let url = NSURL(string: type.icon!)
        self.headerImageView.kf_setImageWithURL(url)
        
        self.nameLabel.text = type.title
        
        self.detailLabel.text = type.desc
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
