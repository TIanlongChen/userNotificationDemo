//
//  NotificationViewController.swift
//  notificationContentExtensionDemo
//
//  Created by Tom on 4/29/19.
//  Copyright © 2019 Tianlong Chen. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {
    
    
    @IBOutlet weak var pikachuImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let size = view.bounds.size
        preferredContentSize = CGSize(width: size.width, height: size.height / 4)

    }
    
    func didReceive(_ notification: UNNotification) {
        pikachuImage.image = #imageLiteral(resourceName: "whosThat")
    }
    
    func didReceive(_ response: UNNotificationResponse, completionHandler completion: @escaping (UNNotificationContentExtensionResponseOption) -> Void) {
        pikachuImage.image = #imageLiteral(resourceName: "itsPika")
        completion(.doNotDismiss)
        
    }
    
}
