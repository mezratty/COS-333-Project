//
//  CalendarViewController.swift
//  333 Project
//
//  Created by Alexa Wojak on 4/7/16.
//  Copyright © 2016 Divya Mehta. All rights reserved.
//

import UIKit
import PDTSimpleCalendar

class CalendarViewController: PDTSimpleCalendarViewController {

    override func viewDidLoad() {
        self.weekdayHeaderEnabled = true
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
