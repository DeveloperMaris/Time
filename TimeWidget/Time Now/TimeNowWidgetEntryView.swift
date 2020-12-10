//
//  TimeNowWidgetEntryView.swift
//  TimeWidgetExtension
//
//  Created by Maris Lagzdins on 04/12/2020.
//  Copyright © 2020 Maris Lagzdins. All rights reserved.
//

import WidgetKit
import SwiftUI

struct TimeNowWidgetEntryView : View {
    var entry: TimeNowProvider.Entry

    var body: some View {
        VStack {
            Text(dateString(using: .for12hours))
                .bold()

            Color.primary
                .frame(width: 100, height: 1)
                .padding(.bottom, 4)

            Text(dateString(using: .for24hours))
                .bold()
        }
    }

    func dateString(using formatter: DateFormatter) -> String {
        formatter.string(from: entry.date)
    }
}

struct TimeNowWidgetEntryView_Previews: PreviewProvider {
    static var previews: some View {
        TimeNowWidgetEntryView(entry: TimeNowEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
