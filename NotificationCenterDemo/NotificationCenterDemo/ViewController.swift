//
//  ViewController.swift
//  NotificationCenterDemo
//
//  Created by Tianlong Chen on 4/26/19.
//  Copyright © 2019 Tianlong Chen. All rights reserved.
//

import UIKit
import UserNotifications
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge], completionHandler: {didAllow, error in})
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    
    @IBAction func sendNoti(_ sender: UIButton) {
        let content = UNMutableNotificationContent();
        content.title = "App a needs your attention"
        content.subtitle = "This is a subtitle"
        content.body = "This will stay on your notification center to annoy you. You will have to remove it manually ;)"
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false);
        
        let request = UNNotificationRequest(identifier: "ThisRequestID", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    

}

