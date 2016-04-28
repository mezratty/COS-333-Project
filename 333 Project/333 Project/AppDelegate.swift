//
//  AppDelegate.swift
//  333 Project
//
//  Created by Divya Mehta on 4/4/16.
//  Copyright © 2016 Divya Mehta. All rights reserved.
//

import UIKit
import Firebase


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        //ACTIONS
        let firstAction: UIMutableUserNotificationAction = UIMutableUserNotificationAction()
        firstAction.identifier = "FIRST_ACTION"
        firstAction.title = "Dismiss"
        firstAction.destructive = true
        firstAction.authenticationRequired = false
        firstAction.activationMode = UIUserNotificationActivationMode.Background
        
        let secondAction: UIMutableUserNotificationAction = UIMutableUserNotificationAction()
        secondAction.identifier = "SECOND_ACTION"
        secondAction.title = "Open TigerWire"
        secondAction.destructive = false
        secondAction.authenticationRequired = false
        secondAction.activationMode = UIUserNotificationActivationMode.Foreground
        
        let thirdAction: UIMutableUserNotificationAction = UIMutableUserNotificationAction()
        thirdAction.identifier = "THIRD_ACTION"
        thirdAction.title = "third action"
        thirdAction.destructive = false
        thirdAction.authenticationRequired = false
        thirdAction.activationMode = UIUserNotificationActivationMode.Background
        
        
        //CATEGORIES
        let firstCategory: UIMutableUserNotificationCategory = UIMutableUserNotificationCategory()
        firstCategory.identifier = "FIRST_CATEGORY"
        
        let defaultActions: NSArray = [firstAction, secondAction, thirdAction]
        let minimalActions: NSArray = [firstAction, secondAction]
        
        firstCategory.setActions(defaultActions as? [UIUserNotificationAction], forContext: UIUserNotificationActionContext.Default)
        firstCategory.setActions(minimalActions as? [UIUserNotificationAction], forContext: UIUserNotificationActionContext.Minimal)

        //NSSET OF CATEGORIES
        
        let categories: NSSet = NSSet(objects: firstCategory)
        
        
        let types: UIUserNotificationType = [UIUserNotificationType.Alert, UIUserNotificationType.Badge]
        let mySettings: UIUserNotificationSettings = UIUserNotificationSettings(forTypes: types, categories: categories as? Set<UIUserNotificationCategory>)
        
        UIApplication.sharedApplication().registerUserNotificationSettings(mySettings)
        // Override point for customization after application launch.
        
        
        /*Custom looks*/
        UITabBar.appearance().barTintColor = UIColor.blackColor()
        UITabBar.appearance().tintColor = UIColor.whiteColor()
        UINavigationBar.appearance().barTintColor = UIColor.blackColor()
        UINavigationBar.appearance().titleTextAttributes = [
            NSForegroundColorAttributeName : UIColor.whiteColor()
        ]
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        //var urlString = "https://blistering-torch-3510.firebaseio.com/matches/" + globalNetId
        var urlString = "https://blistering-torch-3510.firebaseio.com/notifs/" + globalNetId
        var ref = Firebase(url:urlString)
        
        
        ref.observeEventType(.ChildAdded, withBlock: {snapshot in

                print(snapshot)
                let first = String(snapshot.value["first"] as! String)
                let last = String(snapshot.value["last"] as! String)
                let user = String(snapshot.value["user"] as! String)
            
                UIApplication.sharedApplication().applicationIconBadgeNumber += 1
                let notification: UILocalNotification = UILocalNotification()
                notification.category = "FIRST_CATEGORY"
                //notification.applicationIconBadgeNumber = UIApplication.sharedApplication().applicationIconBadgeNumber + 1
                notification.alertBody = "\(first) \(last) (\(user)) wants to buy (sell you) a ticket!"
                UIApplication.sharedApplication().presentLocalNotificationNow(notification)
                //UIApplication.sharedApplication().applicationIconBadgeNumber = 0

                ref.removeValue()
        })
      
    
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        UIApplication.sharedApplication().applicationIconBadgeNumber = 0
        
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func registerForPushNotifications(application: UIApplication) {
        let notificationSettings = UIUserNotificationSettings(
            forTypes: [.Badge, .Sound, .Alert], categories: nil)
        application.registerUserNotificationSettings(notificationSettings)
    }

}

