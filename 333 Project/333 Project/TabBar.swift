//
//  TabBar.swift
//  333 Project
//
//  Created by Alexa Wojak on 4/19/16.
//  Copyright © 2016 Divya Mehta. All rights reserved.
//

import UIKit

class TabBar: UITabBarController {
    var tab : UITabBar = UITabBar()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tab = super.tabBar
        /*if (UIApplication.sharedApplication().applicationIconBadgeNumber != 0) {
            super.tabBar.items![2].badgeValue = "\(UIApplication.sharedApplication().applicationIconBadgeNumber)"
            }*/
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    /*override func viewWillAppear(animated: Bool) {
        print("hello")
        super.viewWillAppear(false)
        if (UIApplication.sharedApplication().applicationIconBadgeNumber != 0) {
            super.tabBar.items![2].badgeValue = "\(UIApplication.sharedApplication().applicationIconBadgeNumber)"
        }
    }
    override func viewDidAppear(animated: Bool) {
        print("hello")
        super.viewDidAppear(false)
        if (UIApplication.sharedApplication().applicationIconBadgeNumber != 0) {
            super.tabBar.items![2].badgeValue = "\(UIApplication.sharedApplication().applicationIconBadgeNumber)"
        }
    }
    override func viewWillDisappear(animated: Bool) {
        print("hello")
        super.viewWillDisappear(false)
        if (UIApplication.sharedApplication().applicationIconBadgeNumber != 0) {
            super.tabBar.items![2].badgeValue = "\(UIApplication.sharedApplication().applicationIconBadgeNumber)"
        }
    }
    override func viewDidDisappear(animated: Bool) {
        print("hello")
        super.viewDidDisappear(false)
        if (UIApplication.sharedApplication().applicationIconBadgeNumber != 0) {
            super.tabBar.items![2].badgeValue = "\(UIApplication.sharedApplication().applicationIconBadgeNumber)"
        }
    }*/
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
