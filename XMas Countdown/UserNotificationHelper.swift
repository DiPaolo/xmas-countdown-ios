//
//  UserNotificationHelper.swift
//  XMas Countdown
//
//  Created by Pavel Ditenbir on 06.12.2020.
//

import Foundation

class UserNotificationHelper {
    static public func updateBadgeCounter() {
        UserNotificationManager.resetBageCounter()
        
        let gifts = PersistentStore.gifts()
        for gift in gifts {
            if !gift.isOpened && DateHelper.isGiftReadyToBeOpened(gift.day) {
                UserNotificationManager.incrementBageCounter()
            }
        }
    }
}
