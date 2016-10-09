//
//  CategoryModel.swift
//  AHXTest
//
//  Created by qianfeng on 16/10/6.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class CategoryModel: NSObject {

    var header: String?
    var typeArray: NSArray?
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}
class CategoryType: NSObject {
    
    var desc: String?
    var icon: String?
    var querystr: String?
    var title:String?
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
      
    }
}
