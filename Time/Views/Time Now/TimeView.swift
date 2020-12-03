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

    var body: some View {
        Text(date, formatter: formatter)
            .bold()
            .font(.largeTitle)
    }
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView(date: Date(), formatter: .for12hours)
    }
}
