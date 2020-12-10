//
//  TimeNowProvider.swift
//  TimeWidgetExtension
//
//  Created by Maris Lagzdins on 04/12/2020.
//  Copyright © 2020 Maris Lagzdins. All rights reserved.
//

import WidgetKit

struct TimeNowProvider: TimelineProvider {
    typealias Entry = TimeNowEntry

    let calendar = Calendar.current

    func placeholder(in context: Context) -> Entry {
        TimeNowEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (Entry) -> ()) {
        let entry = TimeNowEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries = [TimeNowEntry]()

        let date = Date()
        let midnight = date.midnight()
        let minutesInDay = date.minutesInTotal()

        for offset in 0 ... minutesInDay {
            let entryDate = calendar.date(byAdding: .minute, value: offset, to: midnight)!
            entries.append(TimeNowEntry(date: entryDate))
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)

        completion(timeline)
    }
}
