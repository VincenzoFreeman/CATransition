//
//  ShopItem.swift
//  CATransition
//
//  Created by wenzhiji on 16/4/28.
//  Copyright © 2016年 Manager. All rights reserved.
//

import UIKit

class ShopItem: NSObject {
    var q_pic_url : String = ""
    var z_pic_url : String = ""
    init(dict : [String : AnyObject] ) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    // 避免找不到属性报错
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}
