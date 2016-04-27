//
//  SecondViewController.swift
//  333 Project
//
//  Created by Divya Mehta on 4/4/16.
//  Copyright © 2016 Divya Mehta. All rights reserved.
//



import UIKit
import Firebase

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //var tableView: UITableView  =   UITableView()
    var events = NSMutableArray()
    var temp = []
    //var events = [NSMutableArray]()
    //var sections: NSArray = NSArray.init(array: [2, 200])
    
    // Get a reference to our posts
    var ref = Firebase(url:"https://blistering-torch-3510.firebaseio.com/events")
    //var games : NSMutableArray = []
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        
        // Do any additional setup after loading the view, typically from a nib.
        
        // Attach a closure to read the data at our posts reference
        ref.observeEventType(.Value, withBlock: { snapshot in
            snapshot.value
            }, withCancelBlock: { error in
                print(error.description)
        })

        let backgroundview = BackgroundView()
        self.view = backgroundview
        self.view.addSubview(tableView)
        backgroundview.startColor = UIColor.orangeColor()
        backgroundview.endColor = UIColor.whiteColor()
        tableView.backgroundColor = UIColor.clearColor()
        UITableViewCell.appearance().backgroundColor = UIColor.clearColor()
        tableView.separatorColor = UIColor.blackColor()
        
        
        //SET CONSTRAINTS FOR TABLVIEW
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let centerXConstraint = NSLayoutConstraint(item: self.tableView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        
        let centerYConstraint = NSLayoutConstraint(item: self.tableView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0)
        
        let widthConstraint = NSLayoutConstraint(item: self.tableView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0)
        
        let heightConstraint = NSLayoutConstraint(item: self.tableView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)
        
        self.view.addConstraint(centerXConstraint)
        self.view.addConstraint(centerYConstraint)
        self.view.addConstraint(widthConstraint)
        self.view.addConstraint(heightConstraint)


        
        //view.bringSubviewToFront(BackgroundView())
        /*
        var counter = 0
        var month = 4
        var day = 1
        var year = 2016
        for i in 0 ..< 372 {
            if (counter < 31) {day += 1; counter += 1}
            else {counter = 0; day = 1; month+=1; if(month == 13){month = 1; year+=1}}
            
            var totalDate = month*100+day+year*10000
            
            print(totalDate)
        
        //ref.queryOrderedByChild("dateInt").observeEventType(.Value, withBlock: {snapshot in
        ref.queryOrderedByChild("dateInt").queryEqualToValue(totalDate).observeEventType(.Value, withBlock: {snapshot in
            var tempEvents = [NSMutableArray]()
            
            //print(snapshot)
            
            for item in snapshot.children {
                //if (item.value["dateInt"] as! Int != 2016) {
                
                    let event = NSMutableArray()
                
                    let name = String(item.value["name"] as! String)
                    let key = String(item.key as String)
                    let date = String(item.value["date"] as! String)
                
                    event.addObject(name)
                    event.addObject(key)
                    event.addObject(date)
                    tempEvents.append(event)
                //}
            }
            if (tempEvents.count > 0) {self.events.addObject(tempEvents)}
            //self.events = tempEvents
            self.tableView.reloadData()
           // print("query")
            //print(self.events.count)
        
        })
            
        }*/
        
        
        ref.queryOrderedByChild("dateInt").observeEventType(.Value, withBlock: {snapshot in
            var tempEvents = [NSMutableArray]()
            
            //print(snapshot)
            
            for item in snapshot.children {
                if (item.value["dateInt"] as! Int != 20160000) {
                
                let event = NSMutableArray()
                
                let name = String(item.value["name"] as! String)
                let key = String(item.key as String)
                let date = String(item.value["date"] as! String)
                let dateInt = item.value["dateInt"] as! Int
                
                event.addObject(name)
                event.addObject(key)
                event.addObject(date)
                event.addObject(dateInt)
                tempEvents.append(event)
                }
            }
            //if (tempEvents.count > 0) {self.events.addObject(tempEvents)}
            self.temp = tempEvents
            var startIndex = 0
            var currentDate = 20160401
            for i in 0 ..< self.temp.count {
                if (self.temp[i].objectAtIndex(3) as!Int != currentDate) {
                    var dayEvents = NSMutableArray()
                    for j in startIndex..<i {
                        dayEvents.addObject(self.temp[j])
                    }
                    if (dayEvents.count > 0) {self.events.addObject(dayEvents)}
                    startIndex = i
                    currentDate = self.temp[i].objectAtIndex(3) as! Int
                }
            }
            
            
            
            self.tableView.reloadData()
            // print("query")
            //print(self.events.count)
            
        })
        
        
        
        
        //self.tableView.reloadData()
        
        tableView.frame         =   CGRectMake(0, 50, 320, 500);
        tableView.delegate      =   self
        tableView.dataSource    =   self
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        //self.view.addSubview(tableView)

        //tableView.layer.borderColor = UIColor.blackColor().CGColor
        //tableView.layer.backgroundColor = UIColor.redColor().CGColor
        super.viewDidLoad()
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return events.count
        //if (section == 0) {print("here"); return 2}
        //if (section == 1) {print("here2"); return events.count-2}
        //return 1
        return self.events.objectAtIndex(section).count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        //return 2
        return self.events.count
        
    }
    
     func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.events.objectAtIndex(section).objectAtIndex(0).objectAtIndex(2) as! String
        
    }
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        //print(indexPath.row)
        if (events.count) > 0 {
        
        //print(self.events.objectAtIndex(indexPath.section).objectAtIndex(indexPath.row).objectAtIndex(0))
            
        //cell.textLabel?.text = (self.events[indexPath.row]).objectAtIndex(0) as! String
        cell.textLabel?.text = self.events.objectAtIndex(indexPath.section).objectAtIndex(indexPath.row).objectAtIndex(0) as! String
        }
        
        
        return cell
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //print(events[indexPath.row].objectAtIndex(1))
        
        //self.performSegueWithIdentifier("UpToEvent", sender: indexPath.row)
        //self.performSegueWithIdentifier("UpToEvent", sender: self.events[indexPath.row].objectAtIndex(1))
        self.performSegueWithIdentifier("UpToEvent", sender: self.events.objectAtIndex(indexPath.section).objectAtIndex(indexPath.row).objectAtIndex(1))
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

