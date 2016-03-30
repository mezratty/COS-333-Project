//
//  UpcomingNavController.swift
//  TestCal
//
//  Created by Alexa Wojak on 3/30/16.
//  Copyright (c) 2016 Alexa Wojak. All rights reserved.
//


import UIKit
class UpcomingNavController: UINavigationController {
    
    override func viewDidLoad() {
        
        let upcomingViewController: UIViewController = UpcomingController()
        self.viewControllers = [upcomingViewController]
        
        
        self.navigationBarHidden = true
        let navBar : UINavigationBar = UINavigationBar(frame: CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 64.0))
        navBar.tintColor = UIColor.whiteColor()
        let navItem: UINavigationItem = UINavigationItem()
        navItem.title = "UPCOMING EVENTS"
        navBar.items = [navItem]
        self.view.addSubview(navBar)
        
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



