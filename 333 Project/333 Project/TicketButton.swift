//
//  TicketButton.swift
//  333 Project
//
//  Created by Mitch Hamburger on 4/20/16.
//  Copyright © 2016 Divya Mehta. All rights reserved.
//


import UIKit
@IBDesignable

class TicketButton: UIButton {
    @IBInspectable var fillColor: UIColor = UIColor.darkGrayColor()
    @IBInspectable var strokeColor: UIColor = UIColor.orangeColor()
    @IBInspectable var isBuy: Bool = false
    @IBInspectable var isSell: Bool = false
    
    
    override func drawRect(rect: CGRect) {
        if (isBuy) {
            let circlePath = UIBezierPath(ovalInRect: rect)
            /*let path = UIBezierPath(ovalInRect: rect)
             fillColor.setFill()
             fillColor.setStroke()
             path.fill()
             path.stroke()*/
            
            fillColor.setFill()
            circlePath.fill()
            
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = circlePath.CGPath
            
            //change the fill color
            shapeLayer.fillColor = UIColor.clearColor().CGColor
            //you can change the stroke color
            shapeLayer.strokeColor = strokeColor.CGColor
            //you can change the line width
            shapeLayer.lineWidth = 3.0
            
            super.setTitle("Buy", forState: UIControlState.Normal)
            super.layer.addSublayer(shapeLayer)
            super.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        }
        if (isSell) {
            let circlePath = UIBezierPath(ovalInRect: rect)
            /*let path = UIBezierPath(ovalInRect: rect)
             fillColor.setFill()
             fillColor.setStroke()
             path.fill()
             path.stroke()*/
            
            fillColor.setFill();
            circlePath.fill()
            
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = circlePath.CGPath
            
            //change the fill color
            shapeLayer.fillColor = UIColor.clearColor().CGColor
            //you can change the stroke color
            shapeLayer.strokeColor = strokeColor.CGColor
            //you can change the line width
            shapeLayer.lineWidth = 3.0
            
            super.setTitle("Sell", forState: UIControlState.Normal)
            super.layer.addSublayer(shapeLayer)
            super.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        }
    }
    
    
    
}


