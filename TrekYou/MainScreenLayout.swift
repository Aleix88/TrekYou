//
//  MainScreenLayout.swift
//  TrekYou
//
//  Created by Aleix Baggerman on 12/9/16.
//  Copyright © 2016 Aleix Baggerman. All rights reserved.
//

import UIKit

/*Dubtes:
    -Perque es fan extensions?
 */

protocol MainLayoutDelegate {
    func getMainViewFrame()->CGRect
}

class MainScreenLayout: UICollectionViewFlowLayout {

    var caches = [[UICollectionViewLayoutAttributes]]()
    var elementWidth:CGFloat!
    var elementHeight:CGFloat!
    var yPositions = [CGFloat]()
    var xPositions = [CGFloat]()
    var cellPaddingX:CGFloat = 20
    var cellPaddingY:CGFloat = 5
    var cache = [UICollectionViewLayoutAttributes]()
    var delegate: MainLayoutDelegate?
    
    override func prepareLayout() {
        super.prepareLayout()
        self.scrollDirection = .Horizontal
        let mainViewWidth: CGFloat = CGRectGetWidth(delegate!.getMainViewFrame())
        let mainViewHeight: CGFloat = CGRectGetHeight(delegate!.getMainViewFrame())
        let headerViewHeight:CGFloat = mainViewHeight/10
        
        for section in 0 ..< collectionView!.numberOfSections() {

            cache = [UICollectionViewLayoutAttributes]()
            if section == 0 {
                caches = [[UICollectionViewLayoutAttributes]]()
            }
            //Com es que aqui agafa el numberOfItems del viewController???????
            for item in 0 ..< numberOfItems{
                
                let indexPath = NSIndexPath(forItem: item, inSection: section)
                let attribute = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
                elementWidth = ((2*mainViewWidth) - (4*cellPaddingX))/3
                elementHeight = mainViewHeight/3
                if item == 0 {
                    yPositions.append((CGFloat(section+1)*headerViewHeight) + (elementHeight*CGFloat(section)))
                }
                xPositions.append(((mainViewWidth/2)-(elementWidth/2)) + (elementWidth*CGFloat(item)) + (cellPaddingX*CGFloat(item)))
                let numberOfItemsInSection = section * numberOfItems
                attribute.frame = CGRect(x: xPositions[item+numberOfItemsInSection], y: yPositions[section], width: elementWidth, height: elementHeight)
                
                cache.append(attribute)
            }
            
            caches.append(cache)
            
        }
        
    }
    
    override func collectionViewContentSize() -> CGSize {
        let width = (elementWidth*CGFloat(collectionView!.numberOfItemsInSection(0))) + CGRectGetWidth(collectionView!.frame)/2
        let contentSize = CGSize(width: width, height: CGRectGetHeight(collectionView!.frame))
        return contentSize
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var cache2 = [UICollectionViewLayoutAttributes]()
        for section in caches {
        
            for att in section {
                cache2.append(att)
            }
            
        }
        return cache2
    }
    

}
