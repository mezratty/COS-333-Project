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
    }
    
    func handleData() {
        
        if (isTitle) {
            super.text = "BodyHype Springshow"
        }
        if (isDescription) {
            super.text = "description"
        }
        if (isTime) {
            super.text = "9 o clock"
        }
        if (isDate) {
            super.text = "jan 4"
        }
    }
}
