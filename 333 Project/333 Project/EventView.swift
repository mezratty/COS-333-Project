//
//  EventView.swift
//  333 Project
//
//  Created by Alexa Wojak on 4/15/16.
//  Copyright © 2016 Divya Mehta. All rights reserved.
//

import UIKit

class EventView: UIViewController {
    
    var eventId:Int = 0
    @IBOutlet weak var eventTitle: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let event = events[eventId] as NSMutableArray
        
        
        var text = event.objectAtIndex(0) as! String
        
        let startIndex = text.startIndex.advancedBy(5)
        let textTwo = text.substringFromIndex(startIndex)
        
        
        eventTitle.text = textTwo
        //eventTitle = (events[eventId] as NSMutableArray).objectAtIndex(0) as! String
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
