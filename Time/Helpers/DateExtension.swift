//
//  DateExtension.swift
//  TimeWidgetExtension
//
//  Created by Maris Lagzdins on 09/12/2020.
//  Copyright © 2020 Maris Lagzdins. All rights reserved.
//

import Foundation

public extension Date {
    func midnight(in calendar: Calendar = .current) -> Date {
        calendar.startOfDay(for: self)
    }

    func midday(in calendar: Calendar = .current) -> Date {
        calendar.date(bySetting: .hour, value: 12, of: midnight())!
    }

    func nextMidnight(in calendar: Calendar = .current) -> Date {
        let midnight = self.midnight()
        let components = calendar.dateComponents([.hour, .minute, .second, .nanosecond], from: midnight)
        return calendar.nextDate(after: midnight, matching: components, matchingPolicy: .nextTime)!
    }

    func minutesInTotal(in calendar: Calendar = .current) -> Int {
        let difference = calendar.dateComponents([.minute], from: midnight(), to: nextMidnight())
        return difference.minute!
    }
}
