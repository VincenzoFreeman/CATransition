//
//  HomeCell.swift
//  CATransition
//
//  Created by wenzhiji on 16/4/28.
//  Copyright © 2016年 Manager. All rights reserved.
//

import UIKit
import SDWebImage

class HomeCell: UICollectionViewCell {
    // MARK:- 懒加载
    private lazy var imageView : UIImageView = UIImageView()
       
    override func awakeFromNib() {
        contentView.addSubview(imageView)
    }
     // 添加属性监听器
    var shop : ShopItem?{
        didSet {
            // nil校验
            guard let urlString = shop?.q_pic_url else {
                return
            }
            
            imageView.sd_setImageWithURL(NSURL(string:urlString ), placeholderImage: UIImage(named: "empty_picture"))
        }
    }
    override func layoutSubviews() {
        imageView.frame = self.bounds
    }

//          override init(frame: CGRect) {
//        super.init(frame: frame)
//        contentView.addSubview(imageView)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}
