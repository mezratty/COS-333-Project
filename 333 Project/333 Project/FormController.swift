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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        print(data)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitName(sender: AnyObject) {
        
        let urlStringTwo = "https://blistering-torch-3510.firebaseio.com/" + (data.objectAtIndex(2) as! String)
        let refTwo = Firebase(url:urlStringTwo)
        var counter = 0
        var key = ""
        var matchLast = ""
        var matchFirst = ""
        var matchNetId = ""
        var matchEventId = data.objectAtIndex(0) as! String
        
    refTwo.queryOrderedByChild("eventId").queryEqualToValue(matchEventId).queryLimitedToFirst(1).observeEventType(.Value, withBlock: {snapshot in
        if (snapshot.exists()) {
            for item in snapshot.children {
                key = item.key
                matchLast = item.value["last"] as! String
                matchFirst = item.value["first"] as! String
                matchNetId = item.value["user"] as! String
                //remove item
                //add pair to match table
            }
        }
        else {
            let urlString = "https://blistering-torch-3510.firebaseio.com/" + (self.data.objectAtIndex(1) as! String)
            let ref = Firebase(url:urlString)
            
            let first = self.firstName.text as! AnyObject
            let last = self.lastName.text as! AnyObject
            
            let ticket = ["eventId":self.data.objectAtIndex(0) as! String, "user": globalNetId, "first": first, "last": last]
            let ticketRef = ref.childByAutoId()
            ticketRef.setValue(ticket)
        }
    })
        /*
        
        if (counter > 1) {
            counter = 0
            refTwo.queryOrderedByChild("eventId").queryEqualToValue(matchEventId).observeEventType(.Value, withBlock: {snapshot in
                if (counter == 0) {
                    key = snapshot.key
                    matchLast = snapshot.value["last"] as! String
                    matchFirst = snapshot.value["first"] as! String
                    matchNetId = snapshot.value["user"] as! String
                }
                counter += 1
            })
            
            print(matchNetId)
            
        }
        
        else {
        
            let urlString = "https://blistering-torch-3510.firebaseio.com/" + (data.objectAtIndex(1) as! String)
            let ref = Firebase(url:urlString)
        
            let first = firstName.text as! AnyObject
            let last = lastName.text as! AnyObject
        
            let ticket = ["eventId":data.objectAtIndex(0) as! String, "user": globalNetId, "first": first, "last": last]
            let ticketRef = ref.childByAutoId()
            ticketRef.setValue(ticket)
        
        }
        
        
        */
    }

}
