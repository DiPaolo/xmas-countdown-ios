//
//  Gift.swift
//  XMas Countdown
//
//  Created by Pavel Ditenbir on 06.12.2020.
//

import Foundation

fileprivate let dayX: Date = {
    var date = DateComponents(year: 2020, month: 12, day: 25)
    return Calendar.current.date(from: date)!
}()

class DateHelper {
    static func daysLeft() -> Int {
        return Calendar.current.dateComponents([.day], from: Date(), to: dayX).day!
    }
    
    static func isGiftReadyToBeOpened(_ day: Int32) -> Bool {
        return day < 25 - daysLeft()
    }
}
