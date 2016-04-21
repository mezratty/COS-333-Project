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
            let startIndex = description.startIndex.advancedBy(9)
            description = description.substringFromIndex(startIndex)
        }
        self.eventDesc.text = description
            
         let date = String(snapshot.value["date"] as? String)
            self.eventDate.text = date
         let time = String(snapshot.value["time"] as? String)
            self.eventTime.text = time
         
         //}
         
         })
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
