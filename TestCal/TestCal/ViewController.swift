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
        
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.grayColor()], forState:.Normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.redColor()], forState:.Selected)
        
        let calendardarNavController: UINavigationController = CalendarNavController()
        let upcomingNavController: UINavigationController = UpcomingNavController()
        //let upcoming: UIViewController = UpcomingController()
        
        self.viewControllers = [calendardarNavController, upcomingNavController]
        
        calendardarNavController.tabBarItem = UITabBarItem()
        calendardarNavController.tabBarItem.title = "Cal"
       
        upcomingNavController.tabBarItem = UITabBarItem()
        upcomingNavController.tabBarItem.title = "Upcoming"

        
        
        // Do any additional setup after loading the view, typically from a nib.

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

