//
//  TopCell.swift
//  TrekYou
//
//  Created by Aleix Baggerman on 18/9/16.
//  Copyright © 2016 Aleix Baggerman. All rights reserved.
//

import UIKit

class TopCell: UICollectionViewCell {

    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.layer.cornerRadius = 10
        self.backgroundColor = UIColor.clearColor()
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSizeMake(-5, 10)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.3
        configureImageView()
        configureBlurView()
    }
    
    func configureImageView() {
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 14
    }
    
    func configureBlurView() {
        blurView.layer.masksToBounds = true
        blurView.layer.cornerRadius = 5
    }

}
