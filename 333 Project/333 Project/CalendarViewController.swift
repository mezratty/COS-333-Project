//
//  CalendarViewController.swift
//  333 Project
//
//  Created by Alexa Wojak on 4/7/16.
//  Copyright © 2016 Divya Mehta. All rights reserved.
//

import UIKit
import PDTSimpleCalendar


class CalendarViewController: PDTSimpleCalendarViewController, PDTSimpleCalendarViewDelegate {

    override func viewDidLoad() {
        
        self.weekdayHeaderEnabled = true
        self.delegate = self
        
        //let dateNow = NSDate()
        //let cal = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        //let newDate = cal.
        
        
        
        super.viewDidLoad()



        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func simpleCalendarViewController(controller: PDTSimpleCalendarViewController!, didSelectDate date: NSDate!) {
        //let dateNow = NSDate()
        //let cal = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        //let newDate = cal.startOfDayForDate(dateNow)
        
        //if(newDate != date) {
     //       print("hello")
        //}
        
        
        /* COMMENT WOULD REMOVE FROM VIEW */
        //self.willMoveToParentViewController(nil)
        //self.view.removeFromSuperview()
        let parent = self.parentViewController
        //self.removeFromParentViewController()
        
        //let dest:DayViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Day") as! DayViewController

        
        parent?.performSegueWithIdentifier("DayView", sender: date)
        
        
        
    }
    
/*
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        }
    }
    */

}
