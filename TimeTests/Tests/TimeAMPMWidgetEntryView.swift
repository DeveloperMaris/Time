//
//  TimeAMPMWidgetEntryView.swift
//  TimeWidgetExtension
//
//  Created by Maris Lagzdins on 04/12/2020.
//  Copyright © 2020 Maris Lagzdins. All rights reserved.
//

import WidgetKit
import SwiftUI

struct TimeAMPMWidgetEntryView : View {
    var entry: TimeAMPMProvider.Entry

    var body: some View {
        HStack {
            Text("AM")
                .font(entry.isAfterMidday == true ? .caption : .title)
                .fontWeight(entry.isAfterMidday == true ? .light : .bold)
            Text("/")
                .padding(.bottom, 2)
            Text("PM")
                .font(entry.isAfterMidday == true ? .title : .caption)
                .fontWeight(entry.isAfterMidday == true ? .bold : .light)
        }
    }
}

struct TimeAMPMWidgetEntryView_Previews: PreviewProvider {
    static var previews: some View {
        TimeAMPMWidgetEntryView(entry: TimeAMPMEntity(date: Date(), isAfterMidday: true))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
