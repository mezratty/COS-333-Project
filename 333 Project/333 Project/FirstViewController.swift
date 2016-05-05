//
//  FirstViewController.swift
//  333 Project
//
//  Created by Divya Mehta on 4/4/16.
//  Copyright © 2016 Divya Mehta. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if (UIApplication.sharedApplication().applicationIconBadgeNumber != 0) {
            let tabArray = self.tabBarController?.tabBar.items as NSArray!
            let tabItem = tabArray.objectAtIndex(2) as! UITabBarItem
            tabItem.badgeValue = "\(UIApplication.sharedApplication().applicationIconBadgeNumber)"
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
     super.viewWillAppear(false)
     if (UIApplication.sharedApplication().applicationIconBadgeNumber != 0) {
        let tabArray = self.tabBarController?.tabBar.items as NSArray!
        let tabItem = tabArray.objectAtIndex(2) as! UITabBarItem
        tabItem.badgeValue = "\(UIApplication.sharedApplication().applicationIconBadgeNumber)"     }
     }
     override func viewDidAppear(animated: Bool) {
     super.viewDidAppear(false)
     if (UIApplication.sharedApplication().applicationIconBadgeNumber != 0) {
        let tabArray = self.tabBarController?.tabBar.items as NSArray!
        let tabItem = tabArray.objectAtIndex(2) as! UITabBarItem
        tabItem.badgeValue = "\(UIApplication.sharedApplication().applicationIconBadgeNumber)"     }
     }
     override func viewWillDisappear(animated: Bool) {
     super.viewWillDisappear(false)
     if (UIApplication.sharedApplication().applicationIconBadgeNumber != 0) {
        let tabArray = self.tabBarController?.tabBar.items as NSArray!
        let tabItem = tabArray.objectAtIndex(2) as! UITabBarItem
        tabItem.badgeValue = "\(UIApplication.sharedApplication().applicationIconBadgeNumber)"     }
     }
     override func viewDidDisappear(animated: Bool) {
     super.viewDidDisappear(false)
     if (UIApplication.sharedApplication().applicationIconBadgeNumber != 0) {
        let tabArray = self.tabBarController?.tabBar.items as NSArray!
        let tabItem = tabArray.objectAtIndex(2) as! UITabBarItem
        tabItem.badgeValue = "\(UIApplication.sharedApplication().applicationIconBadgeNumber)"     }
     }
}

