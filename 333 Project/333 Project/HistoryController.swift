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
        var urlString = "https://blistering-torch-3510.firebaseio.com/matches/" + globalNetId
        var ref = Firebase(url:urlString)
        
        
        //query for date
        ref.observeEventType(.Value, withBlock: { snapshot in
            snapshot.value
            }, withCancelBlock: { error in
                print(error.description)
        })
        
        tableView.backgroundColor = UIColor.clearColor()
        UITableViewCell.appearance().backgroundColor = UIColor.clearColor()
        tableView.separatorColor = UIColor.blackColor()
        
        
        ref.observeEventType(.ChildAdded, withBlock: {snapshot in
            print("here")
            //var tempEvents = [NSMutableArray]()
            
            //print(snapshot)
            
            //for item in snapshot.children {
                
                
                let event = NSMutableArray()
                
                let first = String(snapshot.value["first"] as! String)
                let last = String(snapshot.value["last"] as! String)
                let user = String(snapshot.value["user"] as! String)
                
                event.addObject(first)
                event.addObject(last)
                event.addObject(user)
                self.items.append(event)
                
            //}
            //self.items = tempEvents
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
        
        //cell.textLabel?.text = self.items[indexPath.row] as! String
        cell.textLabel?.text = (items[indexPath.row]).objectAtIndex(0) as! String
        //cell.textLabel?.text = self.items.objectAtIndex(indexPath.row).objectAtIndex(0) as? String
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //print("You selected cell #\(indexPath.row)!")
        
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
