//
//  Wrapper.swift
//  333 Project
//
//  Created by Alexa Wojak on 4/14/16.
//  Copyright © 2016 Divya Mehta. All rights reserved.
//

import UIKit

class Wrapper: UIViewController {

    override func viewDidLoad() {
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
        
        if (segue.identifier == "DayView") {
            //print (sender)
            let dest = segue.destinationViewController as! DayViewController
            dest.date = sender as! NSDate
        }
    
    }
}
