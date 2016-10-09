//
//  HomeViewController.swift
//  人人练习2
//
//  Created by qianfeng on 16/9/2.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

//主页

class HomeViewController: BasicViewController {

    
    @IBAction func photoAction(sender: AnyObject) {
        let photoVc = PhotosViewController()
        self.navigationController?.pushViewController(photoVc, animated: true)
        
    }
    @IBAction func otherAction(sender: AnyObject) {
       
        let otherVc = OtherViewController()
        self.navigationController?.pushViewController(otherVc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
