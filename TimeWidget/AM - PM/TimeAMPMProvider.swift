//
//  TimeAMPMProvider.swift
//  TimeWidgetExtension
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
        let date = Date()

        let hour = calendar.component(.hour, from: date)

        let entry = TimeAMPMEntity(date: date, isAfterMidday: hour >= 12)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries = [TimeAMPMEntity]()

        let date = Date()
        let midnight = date.midnight()
        let midday = date.midday()
        let nextMidnight = date.nextMidnight()

        entries.append(TimeAMPMEntity(date: midnight, isAfterMidday: false))
        entries.append(TimeAMPMEntity(date: midday, isAfterMidday: true))
        entries.append(TimeAMPMEntity(date: nextMidnight, isAfterMidday: false))

        let timeline = Timeline(entries: entries, policy: .after(nextMidnight))

        completion(timeline)
    }
}

