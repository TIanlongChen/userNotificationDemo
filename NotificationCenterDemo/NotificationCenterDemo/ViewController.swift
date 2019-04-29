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
    
    @IBOutlet weak var hoursInput: UITextField!
    @IBOutlet weak var minutesInput: UITextField!
    @IBOutlet weak var contentExtensionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge], completionHandler: {didAllow, error in})
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    @IBAction func timeIntervalExample(_ sender: Any){
        triggerDemo()
    }
    
    @IBAction func sendNoti(_ sender: UIButton) {
        basicNotificationDemo();
    }
    
    @IBAction func testResponse(_ sender: Any) {
        notificationResponseDemo()
    }
    
    
    func basicNotificationDemo(){
        let content = UNMutableNotificationContent();
        content.title = "App a needs your attention"
        content.subtitle = "This is a subtitle"
        content.body = "This will stay on your notification center to annoy you. You will have to remove it manually ;)"
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false);
        
        let request = UNNotificationRequest(identifier: "ThisRequestID", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    
    func triggerDemo(){
        let content = UNMutableNotificationContent();
        content.title = "A Time Test"
        content.subtitle = "A test notification using UNCalendarNotificationTrigger"
        content.body = "Text, Text, Text"
        
        var components = DateComponents()
        components.hour = 1
        components.minute = 13
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
        
        /***let content = UNMutableNotificationContent();
        content.title = "A Time Test"
        content.subtitle = "A test notification using UNTimeIntervalNotificationTrigger"
        content.body = "Text, Text, Text"
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: true); **/

        
        let request = UNNotificationRequest(identifier: "ThisRequestID", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    func contentDemo(){
        
    }
    
    
    func remoreUserNotificationDemo(){
        
    }
    
    func notificationResponseDemo(){
        let content = UNMutableNotificationContent()
        content.title = "Test Response"
        content.body = "Seems good?"
        
        content.categoryIdentifier = NotificationCategory.news.rawValue
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let requestIdentifier = "testNotification"
        
        let request = UNNotificationRequest(identifier: requestIdentifier,
                                            content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if error == nil {
                print("Time Interval Notification scheduled: \(requestIdentifier)")
            }
        }
    }
    
    //@IBOutlet weak var label: UILabel!
    
    @IBAction func notificationContentExtensionButtonPressed(_ sender: Any) {
        let content = UNMutableNotificationContent()
        content.title = "Once again it's time to play:"
        content.subtitle = "Who's that pokemon?"
        content.body = ""
        content.badge = 1
        content.categoryIdentifier = "POKEMON"
        
        content.sound = UNNotificationSound.init(named: UNNotificationSoundName.init("who.mp3"))
        
        let nceTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let nceRequestIdentifier = "POKEMONQuiz"
        let request = UNNotificationRequest(identifier: nceRequestIdentifier, content: content, trigger: nceTrigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if error == nil {
                print("Time Interval Notification scheduled: \(nceRequestIdentifier)")
            }
        }
    }

}

