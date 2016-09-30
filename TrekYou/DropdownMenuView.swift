//
//  DropdownMenuView.swift
//  MenuDesplegable
//
//  Created by Aleix Baggerman on 15/7/16.
//  Copyright © 2016 Aleix Baggerman. All rights reserved.
//

import UIKit

class DropdownMenuView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView = UITableView()
    private var viewController: UIViewController!
    private var panGestureRecognizer: UIPanGestureRecognizer!
    private var numberOfRows: Int!
    private var heightForRowAtIndex: CGFloat!
    private var indexPath: NSIndexPath!
    private var heightForRows: CGFloat!
    private var nibsAtIndex = [Int:String]()
    private var indexs =  [Int]()
    private var mainView:UIView!
    private var blurEffectView:UIVisualEffectView!
    private var initialCenter:CGFloat!
    private let alphaView = UIView()

    var value:CGFloat!
    
    //Variables for blur
    var maxValue:CGFloat!
    var xCenter:CGFloat!
    var panValue:CGFloat = 0
    var firstTime = false
    
    init (menuWidth: CGFloat, menuHeight: CGFloat, viewController: UIViewController, mainViewView: UIView) {
        super.init(frame: CGRect(x: -menuWidth + 4, y: 0, width: menuWidth, height: menuHeight))
        self.backgroundColor =   UIColor.clearColor()
        self.viewController = viewController
        self.mainView = mainViewView
        initialCenter = self.center.x
        calculateAlpha()
        createAlphaView()
        createTableView()
        createPanGesture()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.frame = CGRect(x: -10, y: 0, width: self.frame.width, height: self.frame.height)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.addSubview(tableView)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell!
        if indexs.contains(indexPath.row) {
            cell = tableView.dequeueReusableCellWithIdentifier(nibsAtIndex[indexPath.row]!)
        } else {
            cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        }
    
        return cell
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.row == self.indexPath?.row && self.indexPath != nil && heightForRowAtIndex != nil{
            return heightForRowAtIndex
        }
        
        return heightForRows
    }
    
    private func createPanGesture() {
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction(_:)))
        self.addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc private func panGestureAction(sender: UIPanGestureRecognizer) {
        let viewControllerView = mainView
        let translation = sender.translationInView(viewControllerView)
        let viewWidth = CGRectGetWidth(viewControllerView.frame)/1.2
        let view = sender.view
        var translationX = view!.center.x + translation.x
        let translationY = view!.center.y
        calculateAlpha()
        if translationX >= viewWidth/2 {
            translationX = viewWidth/2
        }
        
        self.center = CGPoint(x: translationX, y: translationY)
        sender.setTranslation(CGPointZero, inView: viewControllerView)
        
        if sender.state == .Ended && sender.view!.center.x <= 0 {
            UIView.animateWithDuration(0.5, animations: {
                sender.view?.frame.origin = CGPoint(x: -viewWidth + 4, y: 0)
            })
        }
        
        if sender.state == .Ended && sender.view!.center.x >= 0 {
            UIView.animateWithDuration(0.5, animations: {
                sender.view?.center.x = viewWidth/2
            })
        }
    }
    
    func setNumberOfRows(numberOfRows: Int) {
        self.numberOfRows = numberOfRows
    }

    func setHeightForRowAtIndexPath(heightForRowAtIndex: CGFloat, indexPath: NSIndexPath){
        self.heightForRowAtIndex = heightForRowAtIndex
        self.indexPath = indexPath
    }
    
    func setHeightForRows(heightForRows: CGFloat) {
        self.heightForRows = heightForRows
    }
    
    func registerNibAtIndex(nibName: String, index: Int) {
        let nib = UINib(nibName: nibName, bundle: nil)
        nibsAtIndex[index] = nibName
        indexs.append(index)
        tableView.registerNib(nib, forCellReuseIdentifier: nibName)

    }
    
    func pressButton(buttonPressed: Bool){
        
        let xPosition = CGRectGetWidth(self.mainView.frame)/1.2
        
        if buttonPressed {
            UIView.animateWithDuration(0.5, animations: {
                self.center.x = xPosition/2
                self.alphaView.alpha = 0.5
            })
        }
    }
    
    private func createAlphaView(){
        let alphaFrame = CGRect(x: CGRectGetWidth(self.frame)-100, y: 0, width: CGRectGetWidth(self.mainView.frame)+100, height: CGRectGetHeight(self.mainView.frame))
        alphaView.frame = alphaFrame
        alphaView.backgroundColor = UIColor.blackColor()
        self.addSubview(alphaView)

    }
    
    private func calculateAlpha() {
        var centerX = self.center.x
        if centerX < 0 {
            centerX = 0
        }
        value = centerX / -initialCenter
        if value >= 0.5 {
            value = 0.5
        }
        alphaView.alpha = value
    }

    
    
}
