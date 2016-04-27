//
//  FormController.swift
//  333 Project
//
//  Created by Alexa Wojak on 4/26/16.
//  Copyright © 2016 Divya Mehta. All rights reserved.
//

import UIKit
import Firebase

class FormController: UIViewController {
    
    var data: NSMutableArray = []
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBInspectable var isBuy: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        print(data)
        
        
        let dateComp: NSDateComponents = NSDateComponents()
        dateComp.year = 2016
        dateComp.month = 04
        dateComp.day = 26
        dateComp.hour = 17
        dateComp.minute = 26
        
        let calendar: NSCalendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)!
        let date: NSDate = calendar.dateFromComponents(dateComp)!
        let notification: UILocalNotification = UILocalNotification()
        notification.category = "FIRST_CATEGORY"
        notification.applicationIconBadgeNumber = UIApplication.sharedApplication().applicationIconBadgeNumber + 1
        notification.alertBody = "(Someone) wants to buy (sell you) a ticket!"
        notification.fireDate = date
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        //UIApplication.sharedApplication().presentLocalNotificationNow(notification)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitName(sender: AnyObject) {
        
        let urlStringTwo = "https://blistering-torch-3510.firebaseio.com/" + (data.objectAtIndex(2) as! String)
        let refTwo = Firebase(url:urlStringTwo)
        var key = ""
        var matchLast = ""
        var matchFirst = ""
        var matchNetId = ""
        let matchEventId = data.objectAtIndex(0) as! String
        
    refTwo.queryOrderedByChild("eventId").queryEqualToValue(matchEventId).queryLimitedToFirst(1).observeSingleEventOfType(.Value, withBlock: {snapshot in
        if (!snapshot.exists()) {
            let urlString = "https://blistering-torch-3510.firebaseio.com/" + (self.data.objectAtIndex(1) as! String)
            let ref = Firebase(url:urlString)
            
            let first = self.firstName.text as! AnyObject
            let last = self.lastName.text as! AnyObject
            
            let ticket = ["eventId":matchEventId, "user": globalNetId, "first": first, "last": last]
            let ticketRef = ref.childByAutoId()
            ticketRef.setValue(ticket)
            
        }
        else {
            for item in snapshot.children {
                key = item.key
                matchLast = item.value["last"] as! String
                matchFirst = item.value["first"] as! String
                matchNetId = item.value["user"] as! String
                refTwo.childByAppendingPath(key).removeValue()
                
                var urlString = "https://blistering-torch-3510.firebaseio.com/matches/" + globalNetId
                var ref = Firebase(url:urlString)
                
                var ticket = ["eventId":matchEventId, "user": matchNetId, "first": matchFirst, "last": matchLast]
                var ticketRef = ref.childByAutoId()
                ticketRef.setValue(ticket)
                
                urlString = "https://blistering-torch-3510.firebaseio.com/matches/" + matchNetId
                ref = Firebase(url:urlString)
                
                let first = self.firstName.text as! AnyObject
                let last = self.lastName.text as! AnyObject
                
                ticket = ["eventId":matchEventId, "user": globalNetId, "first": first as! String, "last": last as! String]
                ticketRef = ref.childByAutoId()
                ticketRef.setValue(ticket)

                
                /*
                
                let first = self.firstName.text as! AnyObject
                let last = self.lastName.text as! AnyObject
                
                let ticket = ["eventId":matchEventId, "user1": globalNetId, "first1": first, "last1": last, "user2": matchNetId, "first2": matchFirst, "last2": matchLast]
                let ticketRef = ref.childByAutoId()
                ticketRef.setValue(ticket)
 */
            }
            
        }
        
    })
    }

}
