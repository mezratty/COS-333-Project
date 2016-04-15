//
//  TabBarItem.swift
//  Pods
//
//  Created by Mitch Hamburger on 4/14/16.
//
//

import UIKit

@IBDesignable

class TabBarItem: UITabBarItem {
    @IBInspectable var fillColor: UIColor = UIColor.greenColor()
    @IBInspectable var isCalendar: Bool = true
    
    //override var image: UIImage? = createUpcomingImage()
    func createUpcomingImage() -> UIImage {
        let size = CGSize(width: 120, height: 200)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()
        
        var bar1 = UIBezierPath()
        bar1.moveToPoint(CGPointMake(0, 0))
        bar1.addLineToPoint(CGPointMake(120,0))
        bar1.closePath()
        UIColor.blackColor().setFill()
        bar1.fill()
        
        var bar2 = UIBezierPath()
        bar2.moveToPoint(CGPointMake(0, 100))
        bar2.addLineToPoint(CGPointMake(120, 100))
        bar2.closePath()
        UIColor.blackColor().setFill()
        bar2.fill()
        
        var bar3 = UIBezierPath()
        bar3.moveToPoint(CGPointMake(0, 200))
        bar3.addLineToPoint(CGPointMake(120, 200))
        bar3.closePath()
        UIColor.blackColor().setFill()
        bar3.fill()
        
        //This code must always be at the end of the playground
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

