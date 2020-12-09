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
            Text(entry.date, formatter: DateFormatter.for12hours)
                .bold()

            Color.primary
                .frame(width: 100, height: 1)
                .padding(.bottom, 4)

            Text(entry.date, formatter: DateFormatter.for24hours)
                .bold()
        }
    }
}

struct TimeNowWidgetEntryView_Previews: PreviewProvider {
    static var previews: some View {
        TimeNowWidgetEntryView(entry: TimeNowEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
