//
//  TimeAMPMWidget.swift
//  TimeWidgetExtension
//
//  Created by Maris Lagzdins on 04/12/2020.
//  Copyright © 2020 Maris Lagzdins. All rights reserved.
//

import WidgetKit
import SwiftUI

struct TimeAMPMWidget: Widget {
    let kind: String = "TimeAMPMWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: TimeAMPMProvider()) { entry in
            TimeAMPMWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("AM/PM")
        .description("Provides current period of the day")
        .supportedFamilies([.systemSmall])
    }
}

