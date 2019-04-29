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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    @IBAction func catTest(_ sender: Any) {
        //print("launching a demo")
        categoryDemo()
    }
    
    
    @IBAction func contentTest(_ sender: Any) {
        contentDemo()
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
    
    func categoryDemo(){
        
        let sharkAction = UNNotificationAction(identifier: "SHARK_ACTION", title: "Shark", options: UNNotificationActionOptions(rawValue: 0))
        
        let bearAction = UNNotificationAction(identifier: "BEAR_ACTION", title: "Bear", options: UNNotificationActionOptions(rawValue: 0))
        
        
        let category = UNNotificationCategory(identifier: "ANIMAL_QUESTION", actions: [sharkAction, bearAction], intentIdentifiers: [], options: .customDismissAction)
        
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.setNotificationCategories([category])
        
        let content = UNMutableNotificationContent();
        content.title = "A category Test"
        content.subtitle = "for class and stuff"
        content.body = "What is the cooler animal?"
        content.categoryIdentifier = "ANIMAL_QUESTION"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: "animalRequestID", content: content, trigger: trigger)
        
        notificationCenter.add(request, withCompletionHandler: nil)
        
    }
    
    
    func contentDemo(){
        //let imageurl = URL.init(fileReferenceLiteralResourceName: "owl 2.jpg")
        
        let content = UNMutableNotificationContent();
        content.title = "A content Test"
        content.subtitle = "for class and stuff"
        content.body = "Does this play sound?"
        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "click.caf"))
        //content.sound = UNNotificationSound.default
        
        /*do{
            let attachment = try UNNotificationAttachment(identifier: "owl 2.jpg", url: imageurl, options: nil)
            content.attachments = [attachment]
        }catch{
            print("uh oh")
        }
         */
        
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: "contentRequestID", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    
    func remoreUserNotificationDemo(){
        
    }
    
    func notificationResponseDemo(){
        
    }
    
    func ThomoasTopicDemo(){
        
    }

}

