//
//  UIButton-Extension.swift
//  CATransition
//
//  Created by wenzhiji on 16/4/28.
//  Copyright © 2016年 Manager. All rights reserved.
//

import UIKit
extension UIButton{
    // 添加便利构造函数
    convenience init(title : String, backgroundColor : UIColor,fontSize : CGFloat){
        self.init()
        // 设置按钮属性
        setTitle(title, forState: .Normal)
        self.backgroundColor = backgroundColor
        titleLabel?.font = UIFont.systemFontOfSize(fontSize)
    }
    
}
