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
            
            let calendar = NSCalendar.init(calendarIdentifier: NSGregorianCalendar)
            let componenets = calendar?.components(NSCalendarUnit.Day, fromDate: sender as! NSDate)
            let day:Int! = componenets?.day
            let dayString = String(day)
            
            dest.navigationItem.title = dayString
        }
    
    }
}
