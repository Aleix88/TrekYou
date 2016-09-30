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
    
    override init() {
        super.init()
        placesList()
    }
    
    func addPlace(name: String, image: UIImage, difficult: UInt8){
        let newPlace = Place(name: name, image: image, difficult: difficult)
        places.append(newPlace)
    }
    
    func getPlace(index: Int)->Place{
        return places[index]
    }
    
    func placesList(){
    
        addPlace("Gorgs de la Febro", image: UIImage(named: "Imagen")!, difficult: 1)
        addPlace("Everest", image: UIImage(named: "Imagen")!, difficult: 1)
        addPlace("Parc natural", image: UIImage(named: "Imagen")!, difficult: 1)
        addPlace("Ruta del riu", image: UIImage(named: "Imagen")!, difficult: 1)
        addPlace("Les tres cascades", image: UIImage(named: "Imagen")!, difficult: 1)
        addPlace("Gorgs de la Febro", image: UIImage(named: "Imagen")!, difficult: 1)
        addPlace("Gorgs de la Febro", image: UIImage(named: "Imagen")!, difficult: 1)
        addPlace("Gorgs de la Febro", image: UIImage(named: "Imagen")!, difficult: 1)
        addPlace("Gorgs de la Febro", image: UIImage(named: "Imagen")!, difficult: 1)
        addPlace("Gorgs de la Febro", image: UIImage(named: "Imagen")!, difficult: 1)

        
    }
    
}
