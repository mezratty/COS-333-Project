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
    var nameString:String = ""
    var dateString:String = ""
    var timeString:String = ""
    
    
    @IBOutlet weak var eventTitle: UILabel!
    
    @IBOutlet weak var eventDesc: UILabel!
    
    
    @IBOutlet weak var eventDate: UILabel!
    
    @IBOutlet weak var eventTime: UILabel!
    
    
    @IBOutlet weak var eventLocation: UILabel!
    
    @IBOutlet weak var buy: TicketButton!
    
    @IBOutlet weak var sell: TicketButton!
    
    override func viewDidLoad() {
        
        eventTitle.layer.borderWidth = 0.5
        eventTitle.layer.borderColor = UIColor.blackColor().CGColor
        eventTitle.layer.cornerRadius = 3
        eventTitle.textColor = UIColor.blackColor()
        eventTitle.layer.backgroundColor = UIColor.whiteColor().CGColor
        
        eventDesc.layer.borderWidth = 0.5
        eventDesc.layer.borderColor = UIColor.blackColor().CGColor
        eventDesc.layer.cornerRadius = 3
        eventDesc.textColor = UIColor.blackColor()
        eventDesc.layer.backgroundColor = UIColor.whiteColor().CGColor
        
        eventDate.layer.borderWidth = 0.5
        eventDate.layer.borderColor = UIColor.blackColor().CGColor
        eventDate.layer.cornerRadius = 3
        eventDate.textColor = UIColor.blackColor()
        eventDate.layer.backgroundColor = UIColor.whiteColor().CGColor

        eventTime.layer.borderWidth = 0.5
        eventTime.layer.borderColor = UIColor.blackColor().CGColor
        eventTime.layer.cornerRadius = 3
        eventTime.textColor = UIColor.blackColor()
        eventTime.layer.backgroundColor = UIColor.whiteColor().CGColor

        eventLocation.layer.borderWidth = 0.5
        eventLocation.layer.borderColor = UIColor.blackColor().CGColor
        eventLocation.layer.cornerRadius = 3
        eventLocation.textColor = UIColor.blackColor()
        eventLocation.layer.backgroundColor = UIColor.whiteColor().CGColor

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
        self.nameString = name
        self.eventTitle.text = "Event: " + name
            
         var description = String(snapshot.value["description"] as? String)
        if description.rangeOfString("Optional") != nil {
            let startIndex = description.startIndex.advancedBy(10)
            description = description.substringFromIndex(startIndex)
            let endIndex = description.endIndex.advancedBy(-2)
            description = description.substringToIndex(endIndex)
        }
            
            var source = String(snapshot.value["source"] as? String)
         /*   if source.rangeOfString("Optional") != nil {
                let startIndex = source.startIndex.advancedBy(10)
                source = source.substringFromIndex(startIndex)
                let endIndex = source.endIndex.advancedBy(-2)
                source = source.substringToIndex(endIndex)
            }*/
            
            if (source.containsString("athletics")) {
                self.eventDesc.text = "Opponent: " + description
            }
            else {self.eventDesc.text = "Description: " + description}
            
            if (!source.containsString("tickets")) {
                self.buy.hidden = true
                self.sell.hidden = true
            }
            
         var date = String(snapshot.value["date"] as? String)
            
            if date.rangeOfString("Optional") != nil {
                let startIndex = date.startIndex.advancedBy(10)
                date = date.substringFromIndex(startIndex)
                let endIndex = date.endIndex.advancedBy(-2)
                date = date.substringToIndex(endIndex)
            }
            
            self.dateString = date
            self.eventDate.text = "Date: " + date
            
         var time = String(snapshot.value["time"] as? String)
            if time.rangeOfString("Optional") != nil {
                let startIndex = time.startIndex.advancedBy(10)
                time = time.substringFromIndex(startIndex)
                let endIndex = time.endIndex.advancedBy(-2)
                time = time.substringToIndex(endIndex)
            }
            
            self.timeString = time
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
        self.dataToPass.addObject(nameString)
        self.dataToPass.addObject(dateString)
        self.dataToPass.addObject(timeString)
        self.performSegueWithIdentifier("toForm", sender: dataToPass)
    }
    
    @IBAction func sellSegue(sender: AnyObject) {
        self.dataToPass.removeAllObjects()
        self.dataToPass.addObject(eventId)
        self.dataToPass.addObject("sell")
        self.dataToPass.addObject("buy")
        self.dataToPass.addObject(nameString)
        self.dataToPass.addObject(dateString)
        self.dataToPass.addObject(timeString)
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
