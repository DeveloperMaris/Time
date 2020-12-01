//
//  ContentView.swift
//  Time
//
//  Created by Maris Lagzdins on 31/10/2020.
//  Copyright © 2020 Maris Lagzdins. All rights reserved.
//

import SwiftUI

struct TimeNowView: View {
    typealias ViewModel = TimeNowViewModel

    @ObservedObject var viewModel: ViewModel

    var body: some View {
        VStack {
            TimeView(date: viewModel.currentDate, formatter: ViewModel.dateFormatterFor12hours)
                .accessibilityIdentifier("time-now.12-hour-format")
            SeparatorView(topCaption: "(12 hours)", bottomCaption: "(24 hours)")
            TimeView(date: viewModel.currentDate, formatter: ViewModel.dateFormatterFor24hours)
                .accessibilityIdentifier("time-now.24-hour-format")
        }
    }
}

#if DEBUG
struct TimeNowView_Previews: PreviewProvider {
    static var previews: some View {
        TimeNowView(viewModel: .makeForTesting())
    }
}
#endif
