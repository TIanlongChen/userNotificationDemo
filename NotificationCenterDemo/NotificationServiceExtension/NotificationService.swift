//
//  NotificationService.swift
//  NotificationServiceExtension
//
//  Created by Tom on 4/29/19.
//  Copyright © 2019 Tianlong Chen. All rights reserved.
//

import UserNotifications

class NotificationService: UNNotificationServiceExtension {

    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?

    override func didReceive(_ request: UNNotificationRequest,
                             withContentHandler contentHandler:
        @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        self.bestAttemptContent = (request.content.mutableCopy()
            as? UNMutableNotificationContent)
        
        // Try to decode the encrypted message data.
        let encryptedData = bestAttemptContent?.userInfo["ENCRYPTED_DATA"]
        if let bestAttemptContent = bestAttemptContent {
            if let data = encryptedData as? String {
                let decryptedMessage = data //self.decrypt(data: data)
                bestAttemptContent.body = decryptedMessage
            }
            else {
                bestAttemptContent.body = "(Encrypted)"
            }
            
            // Always call the completion handler when done.
            contentHandler(bestAttemptContent)
        }
    }
    
    override func serviceExtensionTimeWillExpire() {
        if let contentHandler = contentHandler,
            let bestAttemptContent = bestAttemptContent {
            
            // Mark the message as still encrypted.
            bestAttemptContent.subtitle = "(Encrypted)"
            bestAttemptContent.body = ""
            contentHandler(bestAttemptContent)
        }
    }

}
