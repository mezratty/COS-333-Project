//
//  DayTable.swift
//  333 Project
//
//  Created by Alexa Wojak on 4/15/16.
//  Copyright © 2016 Divya Mehta. All rights reserved.
//

import UIKit
class DayTable: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var date:NSDate!
    
    var tableView: UITableView  =   UITableView()
    
    var items: NSArray = NSArray.init(array: [["BodyHype", 0], ["Mens Soccer", 1]])
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.frame         =   CGRectMake(0, 50, 320, 200);
        tableView.delegate      =   self
        tableView.dataSource    =   self
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.view.addSubview(tableView)
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        //cell.textLabel?.text = self.items[indexPath.row] as! String
        cell.textLabel?.text = self.items.objectAtIndex(indexPath.row).objectAtIndex(0) as? String
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //print("You selected cell #\(indexPath.row)!")
        
        self.performSegueWithIdentifier("EventView", sender: self.items.objectAtIndex(indexPath.row).objectAtIndex(1))
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
            dest.eventId = sender as! Int
            
            let titleString = String(format: "%@%d", "Id:", sender as! Int)
            dest.navigationItem.title = titleString
 
        }
        
    }

    
}
