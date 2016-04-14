//
//  CalWrapper.swift
//  333 Project
//
//  Created by Alexa Wojak on 4/14/16.
//  Copyright © 2016 Divya Mehta. All rights reserved.
//

import UIKit

class CalWrapper: UIViewController {

    override func viewDidLoad() {
        
        if (self.navigationController != nil) {print("hello")}
        
        navigationItem.title = "Calendar"
        
        super.viewDidLoad()
        
        
        let calViewController = CalendarViewController()
        self.addChildViewController(calViewController)
        self.view.addSubview(calViewController.view)
        calViewController.didMoveToParentViewController(self)
        //if (calViewController.showing == false) {print("hello")}
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
       // navigationItem.title = nil
        if (segue.identifier == "DayView") {
            //print (sender)
            //let destNC = segue.destinationViewController as! UINavigationController
            //let dest = destNC.viewControllers.first as! DayViewController
            
            let dest = segue.destinationViewController as! DayViewController
            dest.date = sender as! NSDate
            
            
            let date = sender as! NSDate
            let calendar = NSCalendar.currentCalendar()
            let components = calendar.components([.Day , .Month , .Year], fromDate: date)
            
            let year =  components.year
            let month = components.month
            let day = components.day
            
            /* Format month*/
            let monthNumber = month;
            let dateString = String(format: "%d", monthNumber)
            let dateFormatter = NSDateFormatter.init()
            dateFormatter.dateFormat = "MM"
            let myDate:NSDate = dateFormatter.dateFromString(dateString)!
            let formatter = NSDateFormatter.init()
            formatter.dateFormat = "MMMM"
            let stringFromDate = formatter.stringFromDate(myDate)
            
            
            let titleString = String(format: "%@%@%@%d%@%d", "Date: ", stringFromDate," ", day," ", year)
            dest.navigationItem.title = titleString
            
            
            
            
            
            
            
            //dest.navigationItem.title = monthString + "/" + dayString + "/" + yearString
        }
    
    }
}
