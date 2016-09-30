//
//  TopCell.swift
//  TrekYou
//
//  Created by Aleix Baggerman on 18/9/16.
//  Copyright © 2016 Aleix Baggerman. All rights reserved.
//

import UIKit

class TopCell: UICollectionViewCell {

    @IBOutlet weak var mountainView: UIImageView!
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var placeName: UILabel!
    
    var mountainImage: UIImage!
    var mountainDifficult: UInt8 = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clearColor()
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSizeMake(-5, 10)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.3
        configureImageView()
        configureBlurView()
        setMountainImage()
    }
    
    func configureImageView() {
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 14
    }
    
    func configureBlurView() {
        blurView.layer.masksToBounds = true
        blurView.layer.cornerRadius = 5
    }
    func setMountainImage() {
        mountainImage = UIImage(named: "Montaña")
        mountainView.image = mountainImage
        let rect = CGRectMake(0, 0, mountainImage!.size.width, mountainImage!.size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        CGContextClipToMask(context, rect, mountainImage!
            .CGImage!)
        CGContextSetFillColorWithColor(context, selectColorDifficult().CGColor)
        CGContextFillRect(context, rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let coloredImage = UIImage(CGImage: img.CGImage!, scale: 1.0, orientation: .DownMirrored)
        mountainView.image! = coloredImage
    }
    
    func selectColorDifficult()->UIColor{
        switch  mountainDifficult {
        case 0:
            return UIColor.greenColor()
        case 1:
            return UIColor.orangeColor()
        case 2:
            return UIColor.redColor()
        default:
            return UIColor.blackColor()
        }
        
    }

}
