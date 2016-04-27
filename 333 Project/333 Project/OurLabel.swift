//
//  OurLabel.swift
//  333 Project
//
//  Created by Mitch Hamburger on 4/20/16.
//  Copyright © 2016 Divya Mehta. All rights reserved.
//

import UIKit

@IBDesignable

class OurLabel: UILabel {
    @IBInspectable var fillColor: UIColor = UIColor.greenColor()
    @IBInspectable var isTitle: Bool = false
    @IBInspectable var isDescription: Bool = false
    @IBInspectable var isTime: Bool = false
    @IBInspectable var isDate: Bool = false

    
    override func drawRect(rect: CGRect) {
        handleData()
        super.drawRect(rect)
    }
    
    func handleData() {
        
        if (isTitle) {
            super.text = "Title: " + "BodyHype Springshow"
        }
 
        if (isDescription) {
            super.text = "Description: " + "BodyHype's spring show"
        }
        if (isTime) {
            super.text = "Time: " + "10:00 PM"
        }
        if (isDate) {
            super.text = "Date: " + "May 5"
        }
    }
}
