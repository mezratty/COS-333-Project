//
//  submitButton.swift
//  333 Project
//
//  Created by Mitch Hamburger on 4/26/16.
//  Copyright © 2016 Divya Mehta. All rights reserved.
//

import UIKit
@IBDesignable

class SubmitButton: UIButton {

    @IBInspectable var fillColor: UIColor = UIColor.darkGrayColor()
    @IBInspectable var strokeColor: UIColor = UIColor.orangeColor()
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        super.layer.borderColor = UIColor.whiteColor().CGColor
        super.layer.backgroundColor = UIColor.darkGrayColor().CGColor
        super.tintColor = UIColor.whiteColor()
        super.layer.cornerRadius = 10
        super.layer.borderWidth = 2
        super.setTitle("Submit", forState: UIControlState.Normal)
    }
}
