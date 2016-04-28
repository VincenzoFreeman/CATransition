//
//  PhotoBrowserCell.swift
//  CATransition
//
//  Created by wenzhiji on 16/4/28.
//  Copyright © 2016年 Manager. All rights reserved.
//

import UIKit

import SDWebImage
class PhotoBrowserCell: UICollectionViewCell {
    // MARK:- 懒加载属性
    lazy var imageView = UIImageView()
    // 定义模型属性
    var shop : ShopItem? {
        didSet {
            // nil校验
            guard let urlString = shop?.q_pic_url else {
                return
            }
            // 获得小图
            var smallImage = SDWebImageManager.sharedManager().imageCache.imageFromDiskCacheForKey(urlString)
            // 如果没有小图就为占位图片
            if smallImage == nil {
                smallImage = UIImage(named: "empty_picture")
            }
            // 计算ImageView的frame
            imageView.frame = calculateFrame(smallImage)
            // 设置大图
            guard let bigImageString = shop?.z_pic_url else{
                return
            }
            imageView.sd_setImageWithURL(NSURL(string: bigImageString), placeholderImage: smallImage, options: .RetryFailed) { (image , error, type, url) -> Void in
                self.imageView.frame = self.calculateFrame(image)
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 添加子控件
        contentView.addSubview(imageView)
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension PhotoBrowserCell{
    func calculateFrame(image : UIImage) -> CGRect{
        // 计算imageView的frame
        let x : CGFloat = 0
        let width = UIScreen.mainScreen().bounds.width
        let height = width / image.size.width * image.size.height
        let y = (UIScreen.mainScreen().bounds.height - height) * 0.5
        return CGRectMake(x, y, width, height)
    }
}
