//
//  DateFormatterExtension.swift
//  Time
//
//  Created by Maris Lagzdins on 03/12/2020.
//  Copyright © 2020 Maris Lagzdins. All rights reserved.
//

import Foundation

public extension DateFormatter {
    /// 12-hour date formatter
    static var for12hours: DateFormatter = {
        let formatter = DateFormatter()
        // Need to set the "en_US_POSIX" locale, because this locale is not affected by the 12-hour or 24-hour time
        // format, which can be changed on the device 24-hour time setting
        // (Settings > General > Date & Time > 24-Hour Time)
        //
        // https://developer.apple.com/library/archive/qa/qa1480/_index.html
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "h:mm a"
        return formatter
    }()

    /// 24-hour date formatter
    static var for24hours: DateFormatter = {
        let formatter = DateFormatter()
        // Need to set the "en_US_POSIX" locale, because this locale is not affected by the 12-hour or 24-hour time
        // format, which can be changed on the device 24-hour time setting
        // (Settings > General > Date & Time > 24-Hour Time)
        //
        // https://developer.apple.com/library/archive/qa/qa1480/_index.html
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
}
