//
//  PlacesData.swift
//  TrekYou
//
//  Created by Aleix Baggerman on 26/9/16.
//  Copyright © 2016 Aleix Baggerman. All rights reserved.
//

import UIKit

class PlacesData: NSObject {
    
    var places = [Place]()
    
    func addPlace(name: String, image: UIImage, difficult: UInt8){
        let newPlace = Place(name: name, image: image, difficult: difficult)
        places.append(newPlace)
    }
    
    func getPlace(index: Int)->Place{
        return places[index]
    }
    
}
