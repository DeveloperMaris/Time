//
//  TimeViewModel.swift
//  Time
//
//  Created by Maris Lagzdins on 31/10/2020.
//  Copyright © 2020 Maris Lagzdins. All rights reserved.
//

import Combine
import Foundation
import os.log

class TimeNowViewModel: ObservableObject {
    /// 12-Hour date formatter
    static let dateFormatterFor12hours: DateFormatter = .for12hours
    /// 24-Hour date formatter
    static let dateFormatterFor24hours: DateFormatter = .for24hours

    private let logger = Logger.make(category: "TimeNowViewModel")
    private var timer: AnyCancellable?

    /// Provides current date
    ///
    /// This property will automatically update every second when then `startTimer` method is executed
    @Published private(set) var currentDate: Date

    init(currentDate: Date = .init(), startTimerAutomatically: Bool = true) {
        self.currentDate = currentDate

        if startTimerAutomatically {
            startTimer()
        }
    }

    /// Begins timer countdown to update current date-time every second
    func startTimer() {
        guard timer == nil else { return }

        logger.debug("Start timer")

        timer = Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] value in
                self?.set(date: value)
            }
    }

    /// Set current date parameter by providing a new value
    /// - Parameter date: new Date value
    func set(date: Date) {
        currentDate = date
    }

    /// Invalidate active timer
    func invalidateTimer() {
        logger.debug("Invalidate timer")

        timer?.cancel()
        timer = nil
    }

    deinit {
        invalidateTimer()
    }
}

#if DEBUG
extension TimeNowViewModel {
    static func makeForTesting() -> TimeNowViewModel {
        let env = ProcessInfo.processInfo.environment
        let decoder = JSONDecoder()

        guard let string = env[TimeNowTestModel.key] else {
            return .init()
        }

        guard let data = Data(base64Encoded: string) else {
            return .init()
        }

        guard let model = try? decoder.decode(TimeNowTestModel.self, from: data) else {
            return .init()
        }

        return TimeNowViewModel(currentDate: model.date, startTimerAutomatically: model.startTimerAutomatically)
    }
}
#endif
