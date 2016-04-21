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
    
    var tableView: UITableView  =   UITableView()
    
    // Get a reference to our posts
    var ref = Firebase(url:"https://blistering-torch-3510.firebaseio.com/games")
    //var games : NSMutableArray = []
    var games = [String]()
    
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
        
        ref.observeEventType(.Value, withBlock: {snapshot in
            var tempGames = [String]()
            
            for item in snapshot.children {
                
                let team = String(item.value["team"] as! String)
                tempGames.append(team)
                
            }
            self.games = tempGames
            self.tableView.reloadData()
            print(self.games.count)
        
        })
        
        
        tableView.frame         =   CGRectMake(0, 50, 320, 200);
        tableView.delegate      =   self
        tableView.dataSource    =   self
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.view.addSubview(tableView)
        
        super.viewDidLoad()
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.games.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
    
        var text = self.games[indexPath.row] as! String
        
        //cell.textLabel?.text = self.games[indexPath.row] as! String
        let startIndex = text.startIndex.advancedBy(5)
        let textTwo = text.substringFromIndex(startIndex)
        
        cell.textLabel?.text = textTwo
        print(textTwo)
        
        return cell
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

