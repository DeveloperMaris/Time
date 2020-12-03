//
//  DateFormatterExtension.swift
//  Time
//
//  Created by Maris Lagzdins on 03/12/2020.
//  Copyright © 2020 Maris Lagzdins. All rights reserved.
//

import Foundation

extension DateFormatter {
    /// 12-Hour date formatter
    static let for12hours: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "h:mm a"
        return formatter
    }()

    /// 24-Hour date formatter
    static let for24hours: DateFormatter = {
        let formatter = DateFormatter()
        // Need to set US locale, because without it some other locales
        // can start to display 12 hour format instead of 24 hour format
        // depending on the device "24-Hour Time" setting.
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
}
