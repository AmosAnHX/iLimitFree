//
//  photoListViewController.swift
//  人人练习1
//
//  Created by qianfeng on 16/9/2.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class photoListViewController: BasicViewController {

    //
    var fileName:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //
        let filePath = NSHomeDirectory() + "/Documents/Photos/\(fileName!)"
        
        print(filePath)
        
        let fileManager = NSFileManager.defaultManager()
        var fileNames = try! fileManager.contentsOfDirectoryAtPath(filePath)
        
        print(fileNames)
        
        if fileNames[0] == ".DS_Store"{
            fileNames.removeFirst()
        }
        
        for i in 0..<fileNames.count{
            let x = i % 4
            let y = i / 4
            //
            let frame = CGRectMake(CGFloat(3+x*103), CGFloat(5+y*145), 100, 140)
            let imageName = filePath + "/" + fileNames[i]
            let image = UIImage(named: imageName)
            
            //
            let imageView = UIImageView()
            imageView.frame = frame
            imageView.image = image
            
            //
            let tap = UITapGestureRecognizer(target: self, action: "photoDeltailAction:")
            imageView.addGestureRecognizer(tap)
            imageView.userInteractionEnabled = true
            
            self.view.addSubview(imageView)
        }
    }
    //
    func photoDeltailAction(tap:UITapGestureRecognizer){
        let photoDetailVC = photoDetailViewController()
        //
        let tapImageView = tap.view as! UIImageView
        //
        photoDetailVC.photoDetailImageView.image = tapImageView.image
        
        self.navigationController?.pushViewController(photoDetailVC, animated: true)
        
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
