//
//  FormController.swift
//  333 Project
//
//  Created by Alexa Wojak on 4/26/16.
//  Copyright © 2016 Divya Mehta. All rights reserved.
//

import UIKit
import Firebase

class FormController: UIViewController, UITextFieldDelegate {
    
    var data: NSMutableArray = []
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBInspectable var isBuy: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        lastName.returnKeyType = .Done
        firstName.returnKeyType = .Done
        lastName.delegate = self
        firstName.delegate = self
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
        let eventTitle = data.objectAtIndex(3) as! String
        let eventDate = data.objectAtIndex(4) as! String
        let eventTime = data.objectAtIndex(5) as! String
        
    //refTwo.queryOrderedByChild("eventId").queryEqualToValue(matchEventId).queryLimitedToFirst(1).observeSingleEventOfType(.Value, withBlock: {snapshot in
        refTwo.queryOrderedByChild("event").queryEqualToValue("\(eventTitle)#\(eventDate)#\(eventTime)").queryLimitedToFirst(1).observeSingleEventOfType(.Value, withBlock: {snapshot in
        if (!snapshot.exists()) {
            let urlString = "https://blistering-torch-3510.firebaseio.com/" + (self.data.objectAtIndex(1) as! String)
            let ref = Firebase(url:urlString)
            
            let first = self.firstName.text as! AnyObject
            let last = self.lastName.text as! AnyObject
            
            //let ticket = ["eventId":matchEventId, "user": globalNetId, "first": first, "last": last]
            let ticket = ["event": "\(eventTitle)#\(eventDate)#\(eventTime)", "user": globalNetId, "first": first, "last": last]
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
                var urlStringTwo = "https://blistering-torch-3510.firebaseio.com/notifs/" + globalNetId
                var ref = Firebase(url:urlString)
                var refTwo = Firebase(url:urlStringTwo)
                
                /*var ticket = ["eventId":matchEventId, "user": matchNetId, "first": matchFirst, "last": matchLast,
                    "type":self.data.objectAtIndex(1)]*/
                var ticket = ["event":"\(eventTitle)#\(eventDate)#\(eventTime)", "user": matchNetId, "first": matchFirst, "last": matchLast,
                    "type":self.data.objectAtIndex(1)]
                var ticketRef = ref.childByAutoId()
                var ticketRefTwo = refTwo.childByAutoId()
                ticketRef.setValue(ticket)
                ticketRefTwo.setValue(ticket)
                
                urlString = "https://blistering-torch-3510.firebaseio.com/matches/" + matchNetId
                ref = Firebase(url:urlString)
                urlStringTwo = "https://blistering-torch-3510.firebaseio.com/notifs/" + matchNetId
                refTwo = Firebase(url:urlStringTwo)
                
                let first = self.firstName.text as! AnyObject
                let last = self.lastName.text as! AnyObject
                
                /* ticket = ["eventId":matchEventId, "user": globalNetId, "first": first as! String, "last": last as! String, "type": self.data.objectAtIndex(2)] */
                ticket = ["event":"\(eventTitle)#\(eventDate)#\(eventTime)", "user": globalNetId, "first": first as! String, "last": last as! String, "type": self.data.objectAtIndex(2)]
                ticketRef = ref.childByAutoId()
                ticketRef.setValue(ticket)
                ticketRefTwo = refTwo.childByAutoId()
                ticketRefTwo.setValue(ticket)

            }
            
        }
        
    })
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
