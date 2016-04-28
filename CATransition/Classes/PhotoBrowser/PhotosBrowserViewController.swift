//
//  PhotosBrowserViewController.swift
//  CATransition
//
//  Created by wenzhiji on 16/4/28.
//  Copyright © 2016年 Manager. All rights reserved.
//

import UIKit

class PhotosBrowserViewController: UIViewController {
    private let photosCell = "photosCell"
    var indexPath : NSIndexPath?
    var shops : [ShopItem]?
    // MARK:- 懒加载属性
    private lazy var collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: PhotosBrowserCollectionLayout())
    private lazy var closeButton = UIButton(title: "关 闭", backgroundColor: UIColor.darkGrayColor(), fontSize: 14.0)
    private lazy var saveButton = UIButton(title: "保 存", backgroundColor: UIColor.darkGrayColor(), fontSize: 14.0)
    
    override func loadView() {
        super.loadView()
        view.frame.size.width += 15
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        /// 添加子控件
        setupSubViews()
        // 添加数据源代理
        collectionView.dataSource = self
        collectionView.delegate = self
        // 注册cell
        collectionView.registerClass(PhotoBrowserCell.self, forCellWithReuseIdentifier: photosCell)
        // collectionView 滚动到相应的位置
        collectionView.scrollToItemAtIndexPath(indexPath!, atScrollPosition: .Left, animated: false)
    }
}
// MARK:- 添加子控件
extension PhotosBrowserViewController{
    func setupSubViews(){
        view.addSubview(collectionView)
        view.addSubview(closeButton)
        view.addSubview(saveButton)
        // 设置子控件frame
        collectionView.frame = UIScreen.mainScreen().bounds
        let buttonW : CGFloat = 90
        let buttonH : CGFloat = 32
        let closeButtonX : CGFloat = 20
        let closeButtonY = UIScreen.mainScreen().bounds.height - buttonH - closeButtonX
        let saveButtonX = UIScreen.mainScreen().bounds.width - buttonW - closeButtonX
        closeButton.frame = CGRectMake(closeButtonX, closeButtonY, buttonW, buttonH)
        saveButton.frame = CGRectMake(saveButtonX, closeButtonY, buttonW, buttonH)
        // 监听按钮点击
        closeButton.addTarget(self, action: "dismissButtonClick", forControlEvents: .TouchUpInside)
        saveButton.addTarget(self, action: "saveButtonClick", forControlEvents: .TouchUpInside)
    }
}
// MARK:- 实现监听点击方法
extension PhotosBrowserViewController{
    @objc private func dismissButtonClick(){
        dismissViewControllerAnimated(true, completion: nil)
    }
    @objc private func saveButtonClick(){
        // 取出cell显示的图片
        let cell = collectionView.visibleCells().first as! PhotoBrowserCell
        guard let image = cell.imageView.image else {
            return
        }
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
}
// MARK:- 实现监数据源代理方法
extension PhotosBrowserViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 有值就执行前面的count,没有值就是0
        return shops?.count ?? 0
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(photosCell, forIndexPath: indexPath) as! PhotoBrowserCell
        cell.shop = shops?[indexPath.item]
        return cell
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        dismissButtonClick()
    }
}


