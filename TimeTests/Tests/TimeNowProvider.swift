//
//  TimeNowProvider.swift
//  Time
//
//  Created by Maris Lagzdins on 04/12/2020.
//  Copyright © 2020 Maris Lagzdins. All rights reserved.
//

import WidgetKit

struct TimeNowProvider: TimelineProvider {
    typealias Entry = TimeNowEntry

    func placeholder(in context: Context) -> Entry {
        TimeNowEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (Entry) -> ()) {
        let entry = TimeNowEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries = [TimeNowEntry]()

        let calendar = Calendar.current
        let today = Date()
        let startOfToday = calendar.startOfDay(for: today)
        let components = calendar.dateComponents([.hour, .minute, .second, .nanosecond], from: startOfToday)

        let startOfTomorrow = calendar.nextDate(after: startOfToday, matching: components, matchingPolicy: .nextTime)!
        let difference = calendar.dateComponents([.minute], from: startOfToday, to: startOfTomorrow)
        let minutesInDay = difference.minute!

        for offset in 0 ..< minutesInDay {
            let entryDate = calendar.date(byAdding: .minute, value: offset, to: startOfToday)!
            entries.append(TimeNowEntry(date: entryDate))
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
