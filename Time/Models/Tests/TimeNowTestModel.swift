//
//  TimeNowViewModel+UITests.swift
//  Time
//
//  Created by Maris Lagzdins on 30/11/2020.
//  Copyright © 2020 Maris Lagzdins. All rights reserved.
//

import Foundation

#if DEBUG
struct TimeNowTestModel: Codable {
    var date: Date
    var startTimerAutomatically: Bool
}
#endif
