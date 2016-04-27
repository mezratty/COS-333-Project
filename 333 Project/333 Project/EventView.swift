//
//  EventView.swift
//  333 Project
//
//  Created by Alexa Wojak on 4/15/16.
//  Copyright © 2016 Divya Mehta. All rights reserved.
//

import UIKit
import Firebase
@IBDesignable

class EventView: UIViewController {
    
    //var eventId:Int = 0
    var eventId:String = ""
    var dataToPass: NSMutableArray = []
    
    
    @IBOutlet weak var eventTitle: UILabel!
    
    @IBOutlet weak var eventDesc: UILabel!
    
    
    @IBOutlet weak var eventDate: UILabel!
    
    @IBOutlet weak var eventTime: UILabel!
    
    
    @IBOutlet weak var eventLocation: UILabel!
    
    override func viewDidLoad() {
        
        eventTitle.layer.borderWidth = 4
        eventTitle.layer.borderColor = UIColor.darkGrayColor().CGColor
        eventTitle.layer.cornerRadius = 10
        
        eventDesc.layer.borderWidth = 4
        eventDesc.layer.borderColor = UIColor.darkGrayColor().CGColor
        eventDesc.layer.cornerRadius = 10
        
        eventDate.layer.borderWidth = 4
        eventDate.layer.borderColor = UIColor.darkGrayColor().CGColor
        eventDate.layer.cornerRadius = 10
        
        eventTime.layer.borderWidth = 4
        eventTime.layer.borderColor = UIColor.darkGrayColor().CGColor
        eventTime.layer.cornerRadius = 10
        
        eventLocation.layer.borderWidth = 4
        eventLocation.layer.borderColor = UIColor.darkGrayColor().CGColor
        eventLocation.layer.cornerRadius = 10
        
        let urlString = "https://blistering-torch-3510.firebaseio.com/events/" + eventId
        var ref = Firebase(url:urlString)
        
        
        print(eventId)
        print(urlString)
        
        super.viewDidLoad()
        
        
        ref.observeEventType(.Value, withBlock: { snapshot in
            snapshot.value
            }, withCancelBlock: { error in
                print(error.description)
        })
        
        
        
         ref.observeEventType(.Value, withBlock: {snapshot in

         let name = String(snapshot.value["name"] as! String)
        self.eventTitle.text = "Event: " + name
            
         var description = String(snapshot.value["description"] as? String)
        if description.rangeOfString("Optional") != nil {
            let startIndex = description.startIndex.advancedBy(10)
            description = description.substringFromIndex(startIndex)
            let endIndex = description.endIndex.advancedBy(-2)
            description = description.substringToIndex(endIndex)
        }
        
        self.eventDesc.text = "Opponent: " + description
            
         var date = String(snapshot.value["date"] as? String)
            
            if date.rangeOfString("Optional") != nil {
                let startIndex = date.startIndex.advancedBy(10)
                date = date.substringFromIndex(startIndex)
                let endIndex = date.endIndex.advancedBy(-2)
                date = date.substringToIndex(endIndex)
            }
            
            self.eventDate.text = "Date: " + date
            
         var time = String(snapshot.value["time"] as? String)
            if time.rangeOfString("Optional") != nil {
                let startIndex = time.startIndex.advancedBy(10)
                time = time.substringFromIndex(startIndex)
                let endIndex = time.endIndex.advancedBy(-2)
                time = time.substringToIndex(endIndex)
            }
            self.eventTime.text = "Time: " + time
            
        var location = String(snapshot.value["location"] as? String)
            if location.rangeOfString("Optional") != nil {
                let startIndex = location.startIndex.advancedBy(10)
                location = location.substringFromIndex(startIndex)
                let endIndex = location.endIndex.advancedBy(-2)
                location = location.substringToIndex(endIndex)
            }
            self.eventLocation.text = "Location: " + location
         
         //}
         
         })
        
        
        
        //self.dataToPass.addObject(eventId)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   

    @IBAction func buySegue(sender: AnyObject) {
        self.dataToPass.removeAllObjects()
        self.dataToPass.addObject(eventId)
        self.dataToPass.addObject("buy")
        self.dataToPass.addObject("sell")
        self.performSegueWithIdentifier("toForm", sender: dataToPass)
    }
    
    @IBAction func sellSegue(sender: AnyObject) {
        self.dataToPass.removeAllObjects()
        self.dataToPass.addObject(eventId)
        self.dataToPass.addObject("sell")
        self.dataToPass.addObject("buy")
        self.performSegueWithIdentifier("toForm", sender: dataToPass)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "toForm") {
            
            let dest = segue.destinationViewController as! FormController
            dest.data = sender as! NSMutableArray
            
            
            navigationController?.navigationBar.barTintColor = UIColor.blackColor()
            navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        }
        
    }
    @IBAction func unwindToVC(segue: UIStoryboardSegue) {
        
    }
    
}
