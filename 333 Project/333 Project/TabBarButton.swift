//
//  TabBarButton.swift
//  333 Project
//
//  Created by Mitch Hamburger on 4/15/16.
//  Copyright © 2016 Divya Mehta. All rights reserved.
//

import UIKit

@IBDesignable

class TabBarButton: UIButton {
    @IBInspectable var fillColor: UIColor = UIColor.greenColor()
    @IBInspectable var isCalendar: Bool = true

    
    
    override func drawRect(rect: CGRect) {
        let size = CGSize(width: 120, height: 200)
        
        //UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        //let context = UIGraphicsGetCurrentContext()
        
        var bar1 = UIBezierPath()
        bar1.moveToPoint(CGPointMake(0, 0))
        bar1.addLineToPoint(CGPointMake(20,0))
        //bar1.addLineToPoint(CGPointMake(0, 0))
        bar1.closePath()
        UIColor.blackColor().setFill()
        bar1.fill()
        UIColor.blackColor().setStroke()
        bar1.stroke()
        
        var bar2 = UIBezierPath()
        bar2.moveToPoint(CGPointMake(0, 5))
        bar2.addLineToPoint(CGPointMake(20, 5))
        //bar2.addLineToPoint(CGPointMake(0, 120))
        bar2.closePath()
        UIColor.blackColor().setFill()
        bar2.fill()
        UIColor.blackColor().setStroke()
        bar2.stroke()
        
        var bar3 = UIBezierPath()
        bar3.moveToPoint(CGPointMake(0, 10))
        bar3.addLineToPoint(CGPointMake(20, 10))
        //bar3.addLineToPoint(CGPointMake(0, 0))
        bar3.closePath()
        UIColor.blackColor().setFill()
        bar3.fill()
        UIColor.blackColor().setStroke()
        bar3.stroke()

    }
    

}
