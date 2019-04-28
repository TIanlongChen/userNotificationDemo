//
//  AppDelegate.swift
//  NotificationCenterDemo
//
//  Created by Tianlong Chen on 4/26/19.
//  Copyright © 2019 Tianlong Chen. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let notificationHandler = NotificationHandler()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound, .badge]) {
                (accepted, error) in
                if !accepted {
                    print("User doesn't allow pop up notification")
                }
        }
        
        //add response handler with customized category (Shihong)
        registerNotificationCategory()
        UNUserNotificationCenter.current().delegate = notificationHandler
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    //made for Response (Shihong Ling)
    private func registerNotificationCategory(){
        let newCatagory: UNNotificationCategory = {
            let inputAction = UNTextInputNotificationAction(identifier: NotificationCategoryAction.comment.rawValue, title: "Comment", options: [.foreground], textInputButtonTitle: "Send", textInputPlaceholder: "Leave what you want to say")
            
            let likeAction = UNNotificationAction(identifier: NotificationCategoryAction.like.rawValue, title: "Like", options: [.foreground])
            
            let cancelAction = UNNotificationAction(identifier: NotificationCategoryAction.cancel.rawValue, title: "Cancel", options: [.foreground]
            )
            
            return UNNotificationCategory(identifier: NotificationCategory.news.rawValue, actions: [inputAction,likeAction,cancelAction], intentIdentifiers: [], options: [.customDismissAction])
        }()
        
        UNUserNotificationCenter.current().setNotificationCategories([newCatagory])
    }

}

