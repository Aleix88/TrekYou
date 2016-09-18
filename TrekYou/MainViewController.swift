//
//  MainViewController.swift
//  TrekYou
//
//  Created by Aleix Baggerman on 12/9/16.
//  Copyright © 2016 Aleix Baggerman. All rights reserved.
//

import UIKit

let numberOfSections = 1
let numberOfItems = 8
let cellIdentifier = "TopCell"

class MainViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var bottomCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        (collectionView.collectionViewLayout as! MainScreenLayout).delegate = self
        (bottomCollectionView.collectionViewLayout as! MainScreenLayout).delegate = self
        collectionView.backgroundColor = UIColor.clearColor()
        bottomCollectionView.backgroundColor = UIColor.clearColor()
        let nib = UINib(nibName: "TopCell", bundle: nil)
        collectionView.registerNib(nib, forCellWithReuseIdentifier: "TopCell")
        bottomCollectionView.registerNib(nib, forCellWithReuseIdentifier: "TopCell")
    }
}

extension MainViewController: UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return numberOfSections
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItems
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! TopCell
        animateCell(cell)
        return cell
    }
    //S'hauria de provar l'animacio en el ipad per saber si la primera la fa be o rara.
    func animateCell(cell: UICollectionViewCell){
        cell.alpha = 0
        UIView.animateWithDuration(1) {
            cell.alpha = 1
        }
    }
}

extension MainViewController: MainLayoutDelegate {

    func getMainViewFrame() -> CGRect {
        return self.view.frame
    }
    
}
