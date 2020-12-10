//
//  TimeView.swift
//  Time
//
//  Created by Maris Lagzdins on 31/10/2020.
//  Copyright © 2020 Maris Lagzdins. All rights reserved.
//

import SwiftUI

struct TimeView: View {
    let date: Date
    let formatter: DateFormatter

    private var dateString: String {
        formatter.string(from: date)
    }

    var body: some View {
        // Can't use `Text(Subject, formatter: Formatter)` for now.
        // It seems that SwiftUI changes the formatter locale to the device's current locale,
        // even if a fixed locale is set.
        // Tested with Xcode 12.2, could be that in future releases it changes.
        Text(dateString)
            .bold()
            .font(.largeTitle)
    }
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView(date: Date(), formatter: .for12hours)
    }
}
