//
//  ViewController.swift
//  QuickCard
//
//  Created by  on 2023-03-30.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet var StartButton : UIButton!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        StartButton.layer.cornerRadius = 26
        StartButton.layer.masksToBounds = true

        //added push notifications 1 minute from launch
        checkPushPermission()
    }
    func checkPushPermission() {
        let notifcationCenter = UNUserNotificationCenter.current()
        notifcationCenter.getNotificationSettings { settings in
            switch settings.authorizationStatus {
                case .authorized:
                    self.dispatchNotification()
                case .denied:
                    return
                case .notDetermined:
                notifcationCenter.requestAuthorization(options: [.alert, .sound]) {didAllow, error in
                        if didAllow {
                            self.dispatchNotification()
                        }
                    }
                default:
                    return
                }
        }
    }
    func dispatchNotification() {
        let notificationCenter = UNUserNotificationCenter.current()
        let title = "QuickCard started!"
        let body = "Playing quiz"

        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default

        let date = Date()
        var dateComponent = DateComponents(calendar: Calendar.current, timeZone: TimeZone.current)
        dateComponent.hour = Calendar.current.component(.hour, from: date)
        dateComponent.minute = Calendar.current.component(.minute, from: date) + 1
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        notificationCenter.add(request)

    }
}
