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
        VStack {
            Text(dateString)
                .bold()
                .font(.largeTitle)
        }
    }
}

struct TimeView_Previews: PreviewProvider {
    static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter
    }()

    static var previews: some View {
        TimeView(date: Date(), formatter: formatter)
    }
}
