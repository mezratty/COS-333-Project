//
//  CalendarController.swift
//  TestCal
//
//  Created by Alexa Wojak on 3/30/16.
//  Copyright (c) 2016 Alexa Wojak. All rights reserved.
//


import UIKit
import PDTSimpleCalendar

class CalendarController: PDTSimpleCalendarViewController {
    
    override func viewDidLoad() {
        
        self.weekdayHeaderEnabled = true
        
        
        super.viewDidLoad()

        
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
