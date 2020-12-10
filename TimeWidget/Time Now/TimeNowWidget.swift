//
//  TimeNowWidget.swift
//  TimeWidgetExtension
//
//  Created by Maris Lagzdins on 04/12/2020.
//  Copyright © 2020 Maris Lagzdins. All rights reserved.
//

import WidgetKit
import SwiftUI

struct TimeNowWidget: Widget {
    let kind: String = "TimeNowWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: TimeNowProvider()) { entry in
            TimeNowWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Time Now")
        .description("Provides current time in 12-hour and 24-hour format.")
        .supportedFamilies([.systemSmall])
    }
}
