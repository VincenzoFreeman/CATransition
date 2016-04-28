//
//  HomeViewController.swift
//  CATransition
//
//  Created by wenzhiji on 16/4/28.
//  Copyright © 2016年 Manager. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class HomeViewController: UICollectionViewController {
    private lazy var shops : [ShopItem] = [ShopItem]()
    let homeCell = "homeCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.dataSource
        // 加载数据
        loadData(0)
    }
}
// MARK:- 加载数据
extension HomeViewController{
    func loadData(offset : Int ){
         NetworkTools.shareInstance.loadHomeData(offset) { (result, error) -> () in
        // 校验数据
          if error != nil{
              print(error)
              return
          }
        // 获取结果
          guard let resultArray = result else{
            print("获取的结果不正常")
            return
          }
        // 遍历数据结果转为模型
          for resultDict in resultArray{
              let shop = ShopItem(dict: resultDict)
              self.shops.append(shop)
          }
        // 刷新列表
          self.collectionView?.reloadData()
       }
    
    }
}
// MARK:- UICollectionView DataSource Delegate
extension HomeViewController{
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shops.count
    }
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(homeCell, forIndexPath: indexPath) as! HomeCell
        cell.shop = shops[indexPath.row]
        // 判断是否是最后显示的cell
        if indexPath.item == shops.count - 1{
            loadData(self.shops.count)
        }
        return cell
        
    }
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let photosBrowserVC = PhotosBrowserViewController()
        photosBrowserVC.modalTransitionStyle = .PartialCurl
        // 传递模型
        photosBrowserVC.shops = shops
        photosBrowserVC.indexPath = indexPath
        presentViewController(photosBrowserVC, animated: true, completion: nil)
    }

}