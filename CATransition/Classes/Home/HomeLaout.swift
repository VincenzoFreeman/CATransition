//
//  HomeLaout.swift
//  CATransition
//
//  Created by wenzhiji on 16/4/28.
//  Copyright © 2016年 Manager. All rights reserved.
//

import UIKit

class HomeLaout: UICollectionViewFlowLayout {
    override func prepareLayout() {
        super.prepareLayout()
       /// 定义常量
        let cols : CGFloat = 3
        let margin : CGFloat = 10
        // 设置item宽高
        let itemWH = (UIScreen.mainScreen().bounds.width - (cols + 1) * margin) / cols
        itemSize = CGSize(width: itemWH, height: itemWH)
        // 设置最小间距
        minimumInteritemSpacing = margin
        minimumLineSpacing = margin
        // 设置内边距
        collectionView?.contentInset = UIEdgeInsets(top: margin + 64, left: margin, bottom: margin, right: margin)
    }

}
