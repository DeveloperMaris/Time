//
//  ContentView.swift
//  Time
//
//  Created by Maris Lagzdins on 31/10/2020.
//

import SwiftUI

struct TimeNowView: View {
    typealias ViewModel = TimeNowViewModel

    @StateObject var viewModel = ViewModel()

    var body: some View {
        VStack {
            TimeView(date: viewModel.currentDate, formatter: ViewModel.dateFormatterFor12hours)
            SeparatorView(topCaption: "(12 hours)", bottomCaption: "(24 hours)")
            TimeView(date: viewModel.currentDate, formatter: ViewModel.dateFormatterFor24hours)
        }
        .onAppear {
            viewModel.startTimer()
        }
    }
}

struct TimeNowView_Previews: PreviewProvider {
    static var previews: some View {
        TimeNowView()
    }
}
