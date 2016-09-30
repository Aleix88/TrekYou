//
//  MainViewController.swift
//  TrekYou
//
//  Created by Aleix Baggerman on 12/9/16.
//  Copyright © 2016 Aleix Baggerman. All rights reserved.
//

import UIKit

let numberOfSections = 1
let cellIdentifier = "TopCell"

class MainViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var bottomCollectionView: UICollectionView!
    var headerTopLabel: TopLabel!
    var placesData = PlacesData()
    var slideMenu: DropdownMenuView!

    override func viewDidLoad() {
        super.viewDidLoad()
        congigureCollectionView()
        headerTopLabel = TopLabel(mainViewFrame: self.view.frame)
        setMenuProperties()
        self.view.addSubview(headerTopLabel)
    }
    
    func congigureCollectionView(){
        (collectionView.collectionViewLayout as! MainScreenLayout).delegate = self
        (bottomCollectionView.collectionViewLayout as! MainScreenLayout).delegate = self
        collectionView.backgroundColor = UIColor.clearColor()
        bottomCollectionView.backgroundColor = UIColor.clearColor()
        let nib = UINib(nibName: "TopCell", bundle: nil)
        collectionView.registerNib(nib, forCellWithReuseIdentifier: "TopCell")
        bottomCollectionView.registerNib(nib, forCellWithReuseIdentifier: "TopCell")
    }
    
    func setMenuProperties() {
        
        let width = CGRectGetWidth(self.view.frame)/1.2
        let height = CGRectGetHeight(self.view.frame)
        
        slideMenu = DropdownMenuView(menuWidth: width, menuHeight: height, viewController: MainViewController(), mainViewView: self.view)
        slideMenu.setNumberOfRows(10)
        slideMenu.setHeightForRows(50)
        slideMenu.registerNibAtIndex("SlideMenuCell", index: 1)
        slideMenu.registerNibAtIndex("TitleSlideMenuCell", index: 0)
        slideMenu.registerNibAtIndex("MapMenuCell", index: 2)
        slideMenu.registerNibAtIndex("StatisticsMenuCell", index: 3)
        slideMenu.registerNibAtIndex("InfoMenuCell", index: 4)
        slideMenu.setHeightForRowAtIndexPath(100, indexPath: NSIndexPath(forRow: 0, inSection: 0))
        let currentWindow: UIWindow = UIApplication.sharedApplication().keyWindow!
        currentWindow.addSubview(slideMenu)
    }
    
    @IBAction func pressMenuButton(sender: UIBarButtonItem) {
        slideMenu.pressButton(true)
    }
}

extension MainViewController: UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return numberOfSections
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return placesData.places.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! TopCell
        cell.placeName.text = placesData.getPlace(0).name
        cell.mountainDifficult = placesData.getPlace(0).difficult
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
