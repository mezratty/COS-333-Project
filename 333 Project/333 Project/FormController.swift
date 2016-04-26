//
//  FormController.swift
//  333 Project
//
//  Created by Alexa Wojak on 4/26/16.
//  Copyright © 2016 Divya Mehta. All rights reserved.
//

import UIKit

class FormController: UIViewController {
    
    var data: NSMutableArray = []
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        print(data)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitName(sender: AnyObject) {
        
    }

}
