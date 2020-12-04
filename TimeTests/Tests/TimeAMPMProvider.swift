//
//  TimeAMPMProvider.swift
//  Time
//
//  Created by Maris Lagzdins on 04/12/2020.
//  Copyright © 2020 Maris Lagzdins. All rights reserved.
//

import WidgetKit

struct TimeAMPMProvider: TimelineProvider {
    typealias Entry = TimeAMPMEntity

    func placeholder(in context: Context) -> Entry {
        TimeAMPMEntity(date: Date(), isAfterMidday: true)
    }

    func getSnapshot(in context: Context, completion: @escaping (Entry) -> ()) {
        let calendar = Calendar.current
        let now = Date()

        let hour = calendar.component(.hour, from: now)

        let entry = TimeAMPMEntity(date: Date(), isAfterMidday: hour >= 12)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries = [TimeAMPMEntity]()

        let calendar = Calendar.current
        let today = Date()
        let midnight = calendar.startOfDay(for: today)
        let midday = calendar.date(bySetting: .hour, value: 12, of: midnight)!

        entries.append(TimeAMPMEntity(date: midnight, isAfterMidday: false))
        entries.append(TimeAMPMEntity(date: midday, isAfterMidday: true))

        let nextUpdateDate = calendar.date(from: DateComponents(hour: 23))!

        let timeline = Timeline(entries: entries, policy: .after(nextUpdateDate))
        completion(timeline)
    }
}

