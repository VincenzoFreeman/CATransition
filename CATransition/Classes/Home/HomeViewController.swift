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
    let homeCell = "homeCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension HomeViewController{
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(homeCell, forIndexPath: indexPath)
        cell.backgroundColor = UIColor.redColor()
        return cell
        
    }

}