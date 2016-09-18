//
//  MainViewController.swift
//  TrekYou
//
//  Created by Aleix Baggerman on 12/9/16.
//  Copyright © 2016 Aleix Baggerman. All rights reserved.
//

import UIKit

let numberOfSections = 1
let numberOfItems = 4
let cellIdentifier = "Cell"

class MainViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        (collectionView.collectionViewLayout as! MainScreenLayout).delegate = self
        collectionView.backgroundColor = UIColor.whiteColor()
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
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath)
        cell.backgroundColor = UIColor.blueColor()
        if indexPath.section == 1 {
            cell.backgroundColor = UIColor.redColor()
        }
        return cell
    }
    
}

extension MainViewController: MainLayoutDelegate {

    func getMainViewFrame() -> CGRect {
        return self.view.frame
    }
    
}
