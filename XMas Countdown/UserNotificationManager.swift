//
//  UserNotificationManager.swift
//  XMas Countdown
//
//  Created by Pavel Ditenbir on 06.12.2020.
//

import SwiftUI

class UserNotificationManager {
    static private func setBageCounter(to: Int) {
        let permissionGranted = UserDefaults.standard.bool(forKey: "UserNotificationPermissionsGranted")
        if !permissionGranted {
//            UNUserNotificationCenter.current().requestAuthorization(options: .badge) { (granted, error) in
//                if error != nil {
//                    UserDefaults.standard.set(true, forKey: "UserNotificationPermissionsGranted")
//                }
//            }
        }

        UIApplication.shared.applicationIconBadgeNumber = to
    }

    static func resetBageCounter() {
        setBageCounter(to: 0)
    }
    
    static func incrementBageCounter() {
        setBageCounter(to: UIApplication.shared.applicationIconBadgeNumber + 1)
    }
}
