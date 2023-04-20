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
        //run check push permissions
        checkPushPermission()
    }
    //check for push permissions
    func checkPushPermission() {
        //using userNotifications
        let notifcationCenter = UNUserNotificationCenter.current()
        //send permission request
        notifcationCenter.getNotificationSettings { settings in
            //check permission status
            switch settings.authorizationStatus {
                //send if allowed
                case .authorized:
                    self.dispatchNotification()
                //stop on denied
                case .denied:
                    return
                //else resend permissions
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
        //set title and content body
        let title = "QuickCard started!"
        let body = "Playing quiz"
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        //set current date
        let date = Date()
        var dateComponent = DateComponents(calendar: Calendar.current, timeZone: TimeZone.current)
        dateComponent.hour = Calendar.current.component(.hour, from: date)
        //prompt in 1 minute
        dateComponent.minute = Calendar.current.component(.minute, from: date) + 1
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        //finally queue notification
        notificationCenter.add(request)

    }
    
}
