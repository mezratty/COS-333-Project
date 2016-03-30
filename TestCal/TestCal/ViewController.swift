//
//  ViewController.swift
//  TestCal
//
//  Created by Alexa Wojak on 3/28/16.
//  Copyright (c) 2016 Alexa Wojak. All rights reserved.
//

import UIKit
import PDTSimpleCalendar
class ViewController: UITabBarController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        let calendarViewController: PDTSimpleCalendarViewController = CalendarController()
        
        /*
        FIGURE OUT WHAT THIS DID
        let defaultNavController: UINavigationController = UINavigationController(rootViewController:calendarViewController)
        */
        
        let upcoming: UIViewController = UpcomingController()
        
        self.viewControllers = [calendarViewController, upcoming]
        
        calendarViewController.tabBarItem = UITabBarItem()
        calendarViewController.tabBarItem.title = "Cal"
        upcoming.tabBarItem = UITabBarItem()
        upcoming.tabBarItem.title = "Upcoming"
        

        
        // Do any additional setup after loading the view, typically from a nib.

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

