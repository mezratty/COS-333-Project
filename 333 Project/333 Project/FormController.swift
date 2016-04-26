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
        let urlString = "https://blistering-torch-3510.firebaseio.com/" + (data.objectAtIndex(1) as! String)
        let ref = Firebase(url:urlString)
        
        let first = firstName.text as! AnyObject
        let last = lastName.text as! AnyObject
        
        let ticket = ["eventId":data.objectAtIndex(0) as! String, "user": globalNetId, "first": first, "last": last]
        let ticketRef = ref.childByAutoId()
        ticketRef.setValue(ticket)
        
        //self.performSegueWithIdentifier("submit", sender: data.objectAtIndex(0))
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "submit") {
            
            let dest = segue.destinationViewController as! EventView
            dest.eventId = sender as! String
            
            
            navigationController?.navigationBar.barTintColor = UIColor.blackColor()
            navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        }
        
    }

}
