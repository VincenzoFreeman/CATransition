//
//  PhotosBrowserCollectionLayout.swift
//  CATransition
//
//  Created by wenzhiji on 16/4/28.
//  Copyright © 2016年 Manager. All rights reserved.
//

import UIKit

class PhotosBrowserCollectionLayout: UICollectionViewFlowLayout {
    override func prepareLayout() {
        itemSize = (collectionView?.bounds.size)!
        minimumInteritemSpacing = 0
        minimumLineSpacing = 0
        // 隐藏滚动条
        collectionView?.showsHorizontalScrollIndicator = false
        // 设置水平滚动
        scrollDirection = .Horizontal
        // 开启分页
        collectionView?.pagingEnabled = true
    }
}
