//
//  TopLabel.swift
//  TrekYou
//
//  Created by Aleix Baggerman on 19/9/16.
//  Copyright © 2016 Aleix Baggerman. All rights reserved.
//

import UIKit

class TopLabel: UILabel {
    
    var mainViewFrame:CGRect!
    
    init(mainViewFrame: CGRect) {
        let frame = CGRect(x: 20, y: CGRectGetHeight(mainViewFrame)/9.5, width: CGRectGetWidth(mainViewFrame), height: 50)
        super.init(frame: frame)
        self.mainViewFrame = mainViewFrame
        self.text = "Nuestros favoritos: "
        self.textColor = UIColor.blackColor()
        self.textAlignment = .Left
        self.font = UIFont(name: "CaviarDreams", size: 20)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        
        
    }

}
