//
//  TimeViewModel.swift
//  Time
//
//  Created by Maris Lagzdins on 31/10/2020.
//

import Foundation
import Combine
import os.log

class TimeViewModel: ObservableObject {
    /// 12-Hour date formatter
    static let dateFormatterFor12hours: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "h:mm a"
        return formatter
    }()

    /// 24-Hour date formatter
    static let dateFormatterFor24hours: DateFormatter = {
        let formatter = DateFormatter()
        // Need to set US locale, because without it some other locales
        // can start to display 12 hour format instead of 24 hour format
        // depending on the device "24-Hour Time" setting.
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "HH:mm"
        return formatter
    }()

    private let logger = Logger.make(category: "TimeViewModel")

    private var timer: AnyCancellable?

    /// Provides current date
    ///
    /// This property will automatically update every second when then `startTimer` method is executed
    @Published var currentDate = Date()

    /// Begins timer countdown to update current date-time every second
    func startTimer() {
        guard timer == nil else { return }

        logger.debug("Start timer")

        timer = Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] value in
                self?.currentDate = value
            }
    }

    func invalidateTimer() {
        logger.debug("Invalidate timer")

        timer?.cancel()
        timer = nil
    }

    deinit {
        invalidateTimer()
    }
}
