//
//  Place.swift
//  TrekYou
//
//  Created by Aleix Baggerman on 26/9/16.
//  Copyright © 2016 Aleix Baggerman. All rights reserved.
//

import UIKit

class Place {
    var name:String!
    var image:UIImage!
    var difficult:UInt8!
    
    init(name:String, image:UIImage, difficult: UInt8) {
        self.name = name
        self.image = image
        self.difficult = difficult
        catchDifficultException()
    }
    
    func catchDifficultException() {
        if difficult > 2 {
//            let except = NSException(name: "Difficult error", reason: "This index doesn't belong to any difficult", userInfo: difficult as! AnyObject as? [NSObject : AnyObject])
//            except.raise()
        }
    }
}
