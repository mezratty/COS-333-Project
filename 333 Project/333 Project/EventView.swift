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
    
    //var eventId:Int = 0
    var eventId:String = ""
    
    @IBOutlet weak var eventTitle: UILabel!
    
    @IBOutlet weak var eventDesc: UILabel!
    
    
    @IBOutlet weak var eventDate: UILabel!
    
    @IBOutlet weak var eventTime: UILabel!
    
    
    @IBOutlet weak var eventLocation: UILabel!
    
    override func viewDidLoad() {
        
        
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
        self.eventTitle.text = name
            
         var description = String(snapshot.value["description"] as? String)
        if description.rangeOfString("Optional") != nil {
            let startIndex = description.startIndex.advancedBy(10)
            description = description.substringFromIndex(startIndex)
            let endIndex = description.endIndex.advancedBy(-2)
            description = description.substringToIndex(endIndex)
        }
        
        self.eventDesc.text = description
            
         var date = String(snapshot.value["date"] as? String)
            
            if date.rangeOfString("Optional") != nil {
                let startIndex = date.startIndex.advancedBy(10)
                date = date.substringFromIndex(startIndex)
                let endIndex = date.endIndex.advancedBy(-2)
                date = date.substringToIndex(endIndex)
            }
            
            self.eventDate.text = date
            
         var time = String(snapshot.value["time"] as? String)
            if time.rangeOfString("Optional") != nil {
                let startIndex = time.startIndex.advancedBy(10)
                time = time.substringFromIndex(startIndex)
                let endIndex = time.endIndex.advancedBy(-2)
                time = time.substringToIndex(endIndex)
            }
            self.eventTime.text = time
            
        var location = String(snapshot.value["location"] as? String)
            if location.rangeOfString("Optional") != nil {
                let startIndex = location.startIndex.advancedBy(10)
                location = location.substringFromIndex(startIndex)
                let endIndex = location.endIndex.advancedBy(-2)
                location = location.substringToIndex(endIndex)
            }
            self.eventLocation.text = location
         
         //}
         
         })
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
