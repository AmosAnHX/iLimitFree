//
//  photoDetailViewController.swift
//  人人练习1
//
//  Created by qianfeng on 16/9/2.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class photoDetailViewController: BasicViewController {

    let photoDetailImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //
        photoDetailImageView.frame = UIScreen.mainScreen().bounds
        self.view.addSubview(photoDetailImageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
