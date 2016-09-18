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
        
            cache = [UICollectionViewLayoutAttributes]()
        
            for item in 0 ..< numberOfItems{
                
                let indexPath = NSIndexPath(forItem: item, inSection: 0)
                let attribute = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
                elementWidth = ((2*mainViewWidth) - (4*cellPaddingX))/3
                elementHeight = mainViewHeight/3
                if item == 0 {
                    yPositions.append((CGFloat(1)*headerViewHeight))
                }
                xPositions.append(((mainViewWidth/2)-(elementWidth/2)) + (elementWidth*CGFloat(item)) + (cellPaddingX*CGFloat(item)))
                attribute.frame = CGRect(x: xPositions[item], y: yPositions[0], width: elementWidth, height: elementHeight)
                
                cache.append(attribute)
            }
    }
    
    override func collectionViewContentSize() -> CGSize {
        let width = (elementWidth*CGFloat(collectionView!.numberOfItemsInSection(0))) + CGRectGetWidth(collectionView!.frame)/2
        let contentSize = CGSize(width: width, height: CGRectGetHeight(collectionView!.frame))
        return contentSize
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return cache
    }
    

}
