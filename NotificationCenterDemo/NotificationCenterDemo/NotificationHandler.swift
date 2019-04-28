//
//  NotificationHandler.swift
//  NotificationCenterDemo
//
//  Created by LSH MAC on 4/28/19.
//  Copyright © 2019 Tianlong Chen. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

enum NotificationCategory: String {
    case news
}

enum NotificationCategoryAction: String {
    case like
    case cancel
    case comment
}

class NotificationHandler: NSObject, UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler:
        @escaping () -> Void) {
        
        let categoryIdentifier = response.notification.request.content.categoryIdentifier
        if let category = NotificationCategory(rawValue: categoryIdentifier) {
            switch category {
            case .news:
                handleNews(response: response)
            }
        }
        completionHandler()
    }
    
    private func handleNews(response: UNNotificationResponse) {
        let message: String
        
        if let actionType = NotificationCategoryAction(rawValue: response.actionIdentifier) {
            switch actionType {
            case .like: message = "You choose Vote!"
            case .cancel: message = "You choose Cancel!"
            case .comment:
                message = "You enter：\((response as! UNTextInputNotificationResponse).userText)"
            }
        } else {
            message = ""
        }
        
        if !message.isEmpty {
            showAlert(message: message)
        }
    }
    
    private func showAlert(message: String) {
        if let vc = UIApplication.shared.keyWindow?.rootViewController {
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            vc.present(alert, animated: true)
        }
    }
}
