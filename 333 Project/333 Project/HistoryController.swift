//
//  HistoryController.swift
//  333 Project
//
//  Created by Alexa Wojak on 4/15/16.
//  Copyright © 2016 Divya Mehta. All rights reserved.
//

import UIKit
import Firebase


class HistoryController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var items = [NSMutableArray]()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        let urlString = "https://blistering-torch-3510.firebaseio.com/matches/" + globalNetId
        let ref = Firebase(url:urlString)
        
        
        
        /*if (super.superclass?.sharedApplication().applicationIconBadgeNumber > 0) {
            let imgg:UIImage = UIImage(named: "rsz_1rsz_1rsz_upcoming2.png")!
            super.tabBarItem.image = imgg
            super.tabBarItem.selectedImage = imgg
        }
        else {
            let imgg:UIImage = UIImage(named: "rsz_1rsz_staricon.png")!
            super.tabBarItem.image = imgg
            super.tabBarItem.selectedImage = imgg
        }*/
        
        
        //query for date
        ref.observeEventType(.Value, withBlock: { snapshot in
            snapshot.value
            }, withCancelBlock: { error in
                print(error.description)
        })
        
        tableView.backgroundColor = UIColor.clearColor()
        UITableViewCell.appearance().backgroundColor = UIColor.clearColor()
        tableView.separatorColor = UIColor.blackColor()
        
        var counter = 0
        
        
        ref.observeEventType(.ChildAdded, withBlock: {snapshot in
            
            let event = NSMutableArray()
                
            let first = String(snapshot.value["first"] as! String)
            let last = String(snapshot.value["last"] as! String)
            let user = String(snapshot.value["user"] as! String)
            let eventId = String(snapshot.value["eventId"] as! String)
            let type = String(snapshot.value["type"] as! String)
            
            let urlStringTwo = "https://blistering-torch-3510.firebaseio.com/events/" + eventId
            
            let refTwo = Firebase(url:urlStringTwo)
            print("here")
            
            var eventName = ""
            
            refTwo.observeEventType(.Value, withBlock: {snapshotTwo in
                eventName = String(snapshotTwo.value["name"] as! String)
                
                
                event.addObject(first)
                event.addObject(last)
                event.addObject(user)
                event.addObject(eventName)
                event.addObject(type)
                self.items.append(event)
            /*
            UIApplication.sharedApplication().applicationIconBadgeNumber = 0
            let notification: UILocalNotification = UILocalNotification()
            notification.category = "FIRST_CATEGORY"
            //notification.applicationIconBadgeNumber = UIApplication.sharedApplication().applicationIconBadgeNumber + 1
            notification.alertBody = "\(first) \(last) (\(user)) wants to buy (sell you) a ticket!"
            UIApplication.sharedApplication().presentLocalNotificationNow(notification)
            UIApplication.sharedApplication().applicationIconBadgeNumber = 0
                 */
            self.tableView.reloadData()
                
            })
        })
  
        super.viewDidLoad()
        
        tableView.frame         =   CGRectMake(0, 50, 320, 200);
        tableView.delegate      =   self
        tableView.dataSource    =   self
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.view.addSubview(tableView)
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
        //return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        let event = ((items[indexPath.row]).objectAtIndex(3) as! String)
        let first = ((items[indexPath.row]).objectAtIndex(0) as! String)
        let last = ((items[indexPath.row]).objectAtIndex(1) as! String)
        let user = ((items[indexPath.row]).objectAtIndex(2) as! String)
        
        var type = "buyer"
        if ((items[indexPath.row].objectAtIndex(4) as! String).containsString("buy")) {type = "seller"}
        
        
        //cell.textLabel?.text =  event + " " + first + " " + last + " " + user
        cell.textLabel?.text = "\(last) \(first) (\(user)) \(type): \(event)"
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //print("You selected cell #\(indexPath.row)!")
        
    }
    
    @IBAction func clearMatches(sender: AnyObject) {
        let urlString = "https://blistering-torch-3510.firebaseio.com/matches/" + globalNetId
        let ref = Firebase(url:urlString)
        
        ref.removeValue()
        items.removeAll()
        self.tableView.reloadData()
        
                
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
    }
    
    
}
