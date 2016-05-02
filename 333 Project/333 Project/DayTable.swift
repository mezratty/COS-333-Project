//
//  DayTable.swift
//  333 Project
//
//  Created by Alexa Wojak on 4/15/16.
//  Copyright © 2016 Divya Mehta. All rights reserved.
//

import UIKit
import Firebase

    var items = [NSMutableArray]()

class DayTable: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var date:NSDate!
    
    //var tableView: UITableView  =   UITableView()
    
    @IBOutlet weak var tableView: UITableView!
    
    //var items: NSArray = NSArray.init(array: [["BodyHype", 0], ["Mens Soccer", 1]])
    
    var ref = Firebase(url:"https://blistering-torch-3510.firebaseio.com/events")
    
    override func viewDidLoad() {
        
        //parse the date
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day , .Month , .Year], fromDate: date)
        
        let year =  components.year
        let month = components.month
        let day = components.day
        
        let dateFormatted = year*10000 + day + month*100
        
        print(dateFormatted)
        
        
        
        //query for date
        ref.observeEventType(.Value, withBlock: { snapshot in
            snapshot.value
            }, withCancelBlock: { error in
                print(error.description)
        })
        
        tableView.backgroundColor = UIColor.clearColor()
        UITableViewCell.appearance().backgroundColor = UIColor.clearColor()
        tableView.separatorColor = UIColor.blackColor()
        self.automaticallyAdjustsScrollViewInsets = false
        
        
        ref.queryOrderedByChild("dateInt").queryEqualToValue(dateFormatted).observeEventType(.Value, withBlock: {snapshot in
            var tempEvents = [NSMutableArray]()
            
            for item in snapshot.children {
                
                
                let event = NSMutableArray()
                
                let name = String(item.value["name"] as! String)
                let key = String(item.key as! String)
                //let description = String(item.value["description"] as? String)
                //let date = String(item.value["date"] as? String)
                //let time = String(item.value["time"] as? String)
                
                event.addObject(name)
                event.addObject(key)
                //event.addObject(description)
                //event.addObject(date)
                //event.addObject(time)
                tempEvents.append(event)
                
            }
            items = tempEvents
            self.tableView.reloadData()
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
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        //cell.textLabel?.text = self.items[indexPath.row] as! String
        cell.textLabel?.text = (items[indexPath.row]).objectAtIndex(0) as! String
        //cell.textLabel?.text = self.items.objectAtIndex(indexPath.row).objectAtIndex(0) as? String
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //print("You selected cell #\(indexPath.row)!")
        
        //self.performSegueWithIdentifier("EventView", sender: indexPath.row)
        self.performSegueWithIdentifier("EventView", sender: (items[indexPath.row]).objectAtIndex(1))
    }
    
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        navigationItem.title = nil
        if (segue.identifier == "EventView") {
            //print (sender)
            //let destNC = segue.destinationViewController as! UINavigationController
            //let dest = destNC.viewControllers.first as! DayViewController
            
            let dest = segue.destinationViewController as! EventView
            //dest.eventId = sender as! Int
            dest.eventId = sender as! String
            
            //let titleString = String(format: "%@%d", "Id:", sender as! Int)
            //dest.navigationItem.title = titleString
 
        }
        
    }

    
}
