//
//  EventView.swift
//  333 Project
//
//  Created by Alexa Wojak on 4/15/16.
//  Copyright © 2016 Divya Mehta. All rights reserved.
//

import UIKit
import Firebase

class EventView: UIViewController {
    
    var eventId:Int = 0
    var ref = Firebase(url:"https://blistering-torch-3510.firebaseio.com/games")
    
    @IBOutlet weak var eventTitle: UILabel!
    
    @IBOutlet weak var eventDesc: UILabel!
    
    
    @IBOutlet weak var eventDate: UILabel!
    
    @IBOutlet weak var eventTime: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        ref.observeEventType(.Value, withBlock: { snapshot in
            snapshot.value
            }, withCancelBlock: { error in
                print(error.description)
        })
        
        
        
         ref.queryOrderedByKey().queryEqualToValue(eventId).observeEventType(.Value, withBlock: {snapshot in
         var tempEvents = [NSMutableArray]()
         
         for item in snapshot.children {
         
         
         let event = NSMutableArray()
         
         let name = String(item.value["team"] as! String)
            print(name)
         let description = String(item.value["opponent"] as? String)
         let date = String(item.value["date"] as? String)
         let time = String(item.value["time"] as? String)
         
            event.addObject(name)
            event.addObject(description)
            event.addObject(date)
            event.addObject(time)
            tempEvents.append(event)
         
         }
         events = tempEvents
         print(events.count)
         
         })
        
        print(events.count)
        */
        
        let event = events[eventId] as NSMutableArray
        
        
        var text = event.objectAtIndex(0) as! String
        
        var startIndex = text.startIndex.advancedBy(5)
        var textTwo = text.substringFromIndex(startIndex)
        eventTitle.text = textTwo
        
        text = event.objectAtIndex(1) as! String
        if text.rangeOfString("Optional") != nil {
            startIndex = text.startIndex.advancedBy(9)
            text = text.substringFromIndex(startIndex)
        }
        eventDesc.text = text
        
        //text = event.objectAtIndex(2) as! String
        
        //startIndex = text.startIndex.advancedBy(5)
        //textTwo = text.substringFromIndex(startIndex)
        eventDate.text = text
            
        //text = event.objectAtIndex(3) as! String
        
        //startIndex = text.startIndex.advancedBy(5)
        //textTwo = text.substringFromIndex(startIndex)
        eventTime.text = text
        
        //eventTitle = (events[eventId] as NSMutableArray).objectAtIndex(0) as! String
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
