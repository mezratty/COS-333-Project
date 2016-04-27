//
//  UpcomingController.swift
//  TestCal
//
//  Created by Alexa Wojak on 3/30/16.
//  Copyright (c) 2016 Alexa Wojak. All rights reserved.
//


import UIKit
class UpcomingController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView  =   UITableView()

    let dbManager: DBManager = DBManager(databaseFilename: "EventsDB.sql")

    var items: NSArray{
        return dbManager.loadDataFromDB("select * from events")
    }
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.frame         =   CGRectMake(0, 50, 320, 200);
        tableView.delegate      =   self
        tableView.dataSource    =   self
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.view.addSubview(tableView)
        
        print(self.items.count)
        
        
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
        print("You selected cell #\(indexPath.row)!")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
}


