//
//  ScrollViewCell.swift
//  AHXTest
//
//  Created by qianfeng on 16/10/6.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class ScrollViewCell: UITableViewCell {
    
    @IBOutlet weak var headerScrollView: UIScrollView!
    
    @IBOutlet weak var pageCtrl: UIPageControl!
    
    var dataArray: NSArray? {
        didSet {
            for i in 0..<(dataArray?.count)!{
                //模型对象
                let model = dataArray![i] as! ScrollViewModel
                let frame = CGRectMake(375*CGFloat(i), 0, 375, 160)
                let imageView = UIImageView.createImageView(frame, imageName: nil)
                let url = NSURL(string: model.pic!)
                imageView.kf_setImageWithURL(url, placeholderImage: UIImage(named: "placeholder"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                
                headerScrollView.addSubview(imageView)
            }
            
            self.headerScrollView.delegate = self
            self.headerScrollView.pagingEnabled = true
            self.headerScrollView.bounces = false
            self.headerScrollView.contentSize = CGSizeMake(375*CGFloat((self.dataArray?.count)!), 160)
            
            //分页
            self.pageCtrl.numberOfPages = (dataArray?.count)!
        }
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

//MARK: UIScrollView代理
extension ScrollViewCell: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x/scrollView.bounds.size.width)
        pageCtrl.currentPage = index
    }
}












