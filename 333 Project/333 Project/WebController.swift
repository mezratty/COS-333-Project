//
//  WebController.swift
//  333 Project
//
//  Created by Alexa Wojak on 4/18/16.
//  Copyright © 2016 Divya Mehta. All rights reserved.
//

class WebController: UIViewController, UIWebViewDelegate {
    
    //@IBOutlet weak var myWebView: UIWebView!
    
    @IBOutlet weak var myWebView: UIWebView!
    
    //@IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myWebView.delegate = self
        myWebView.scalesPageToFit = true
        
        
        //1. Load web site into my web view
        
        let myURL = NSURL(string: "http://still-brushlands-47074.herokuapp.com/");
        let myURLRequest:NSURLRequest = NSURLRequest(URL: myURL!);
        myWebView.loadRequest(myURLRequest);

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        //if (request.URLString == "https://still-brushlands-47074.herokuapp.com/index1.php") {
        if request.URLString.rangeOfString("https://still-brushlands-47074.herokuapp.com/index1.php") != nil {
            
            
            let startIndex = request.URLString.startIndex.advancedBy(59)
            let netId = request.URLString.substringFromIndex(startIndex)
            
            self.performSegueWithIdentifier("LoggedIn", sender: netId)
            return false
        }
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        navigationItem.title = nil
        if (segue.identifier == "LoggedIn") {
            
            let dest = segue.destinationViewController as! TabBar
            dest.netId = sender as! String
            
           // dest.navigationController?.visibleViewController!.navigationItem.title = sender as! String
            
           // dest.navigationItem.title = sender as! String
            
            
        }
        
    }
    
}
