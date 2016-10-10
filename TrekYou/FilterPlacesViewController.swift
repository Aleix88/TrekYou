//
//  FilterPlacesViewController.swift
//  TrekYou
//
//  Created by Aleix Baggerman on 30/9/16.
//  Copyright © 2016 Aleix Baggerman. All rights reserved.
//

import UIKit

let identifier = "Cell"

class FilterPlacesViewController: UIViewController {
    
//    var miLabel: UILabel!
    var etiquetas = [UILabel]()
    var xPosicionesEtiquetas = [CGFloat]()
    var etiquetasWidth = [CGFloat]()
    let numeroDeEtiquetas = 2
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        crearEtiquetas()
        // Do any additional setup after loading the view.
    }
    
    func calcularPosicionEtiquetas(index: Int) {
        
        let labelPadding:CGFloat = 5
        let firstPosition = CGRectGetWidth(self.view.frame)/9
        let labelWidth = etiquetas[index].intrinsicContentSize().width + 2*labelPadding
        etiquetasWidth.append(labelWidth)
        xPosicionesEtiquetas.append(firstPosition + CGFloat(index)*etiquetasWidth[index] + CGFloat(index)*labelPadding)
    }
    
    func crearEtiquetas(){
        
        for index in 0 ..< numeroDeEtiquetas {
            let etiqueta = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            etiqueta.text = " x  Dificultad 3"
            etiquetas.append(etiqueta)
            calcularPosicionEtiquetas(index)
            etiqueta.frame = CGRect(x: xPosicionesEtiquetas[index], y: 80, width: etiquetasWidth[index], height: 40)
            etiqueta.textAlignment = .Center
            etiqueta.textColor = UIColor.blackColor()
            etiqueta.backgroundColor = UIColor.lightGrayColor()
            etiqueta.layer.cornerRadius = 20
            etiqueta.clipsToBounds = true
            self.view.addSubview(etiqueta)
        }
    }

}

extension FilterPlacesViewController: UICollectionViewDataSource {

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath)
        animateCell(cell)
        return cell
    }
    
    func animateCell(cell: UICollectionViewCell){
        cell.alpha = 0
        UIView.animateWithDuration(1.5) {
            cell.alpha = 1
        }
    }
    
}
