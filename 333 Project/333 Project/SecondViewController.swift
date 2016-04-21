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
    var ref = Firebase(url:"https://blistering-torch-3510.firebaseio.com/games")
    //var games : NSMutableArray = []
    
    override func viewDidLoad() {
        
        // Do any additional setup after loading the view, typically from a nib.
        
        // Attach a closure to read the data at our posts reference
        ref.observeEventType(.Value, withBlock: { snapshot in
            snapshot.value
            }, withCancelBlock: { error in
                print(error.description)
        })
        
        
        /*
        ref.queryOrderedByChild("team").observeEventType(.ChildAdded, withBlock: { snapshot in
        
            var tempGames = [String]()
            if let team = snapshot.value["team"] as? String{
                //print(team)
                tempGames.append(team)
                //self.games.addObject(team)
                self.tableView.reloadData()
            }
            self.games = tempGames
            print(self.games.count)
        })
 */
        
        ref.queryOrderedByChild("date").observeEventType(.Value, withBlock: {snapshot in
            var tempEvents = [NSMutableArray]()
            
            for item in snapshot.children {
                
                let event = NSMutableArray()
                
                let name = String(item.value["team"] as! String)
                //let key = String(item.key as! String)
                let description = String(item.value["opponent"] as? String)
                let date = String(item.value["date"] as? String)
                let time = String(item.value["time"] as? String)
                
                event.addObject(name)
                //event.addObject(key)
                event.addObject(description)
                event.addObject(date)
                event.addObject(time)
                tempEvents.append(event)
                
                //print(item.key)
                
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
    
        var text = (events[indexPath.row]).objectAtIndex(0) as! String
        
        //cell.textLabel?.text = self.games[indexPath.row] as! String
        let startIndex = text.startIndex.advancedBy(5)
        let textTwo = text.substringFromIndex(startIndex)
        
        cell.textLabel?.text = textTwo
        
        
        return cell
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //self.performSegueWithIdentifier("UpToEvent", sender: indexPath.row)
        self.performSegueWithIdentifier("UpToEvent", sender: indexPath.row)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "UpToEvent") {
            
            let dest = segue.destinationViewController as! EventView
            dest.eventId = sender as! Int
            //dest.eventId = sender as! String
            
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

