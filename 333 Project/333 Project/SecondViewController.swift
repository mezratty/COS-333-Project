//
//  SecondViewController.swift
//  333 Project
//
//  Created by Divya Mehta on 4/4/16.
//  Copyright © 2016 Divya Mehta. All rights reserved.
//

var events = [NSMutableArray]()

import UIKit
import Firebase

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView  =   UITableView()
    
    // Get a reference to our posts
    var ref = Firebase(url:"https://blistering-torch-3510.firebaseio.com/events")
    //var games : NSMutableArray = []
    
    override func viewDidLoad() {
        
        // Do any additional setup after loading the view, typically from a nib.
        
        // Attach a closure to read the data at our posts reference
        ref.observeEventType(.Value, withBlock: { snapshot in
            snapshot.value
            }, withCancelBlock: { error in
                print(error.description)
        })
        
        
        ref.queryOrderedByChild("dateInt").observeEventType(.Value, withBlock: {snapshot in
            var tempEvents = [NSMutableArray]()
            
            for item in snapshot.children {
                if (item.value["dateInt"] as! Int != 2016) {
                
                    let event = NSMutableArray()
                
                    let name = String(item.value["name"] as! String)
                    let key = String(item.key as! String)
                
                    event.addObject(name)
                    event.addObject(key)
                    tempEvents.append(event)
                }
            }
            events = tempEvents
            self.tableView.reloadData()
            print(events.count)
        
        })
        
        
        tableView.frame         =   CGRectMake(0, 50, 320, 500);
        tableView.delegate      =   self
        tableView.dataSource    =   self
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.view.addSubview(tableView)
        
        super.viewDidLoad()
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        cell.textLabel?.text = (events[indexPath.row]).objectAtIndex(0) as! String
        
        
        return cell
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        print(events[indexPath.row].objectAtIndex(1))
        
        //self.performSegueWithIdentifier("UpToEvent", sender: indexPath.row)
        self.performSegueWithIdentifier("UpToEvent", sender: events[indexPath.row].objectAtIndex(1))
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "UpToEvent") {
            
            let dest = segue.destinationViewController as! EventView
            //dest.eventId = sender as! Int
            dest.eventId = sender as! String
            
           // let titleString = String(format: "%@%d", "Id:", sender as! Int)
           // dest.navigationItem.title = titleString
            
            
            navigationController?.navigationBar.barTintColor = UIColor.blackColor()
            navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

