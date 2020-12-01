//
//  ContentView.swift
//  Time
//
//  Created by Maris Lagzdins on 25/11/2020.
//  Copyright © 2020 Maris Lagzdins. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timeNowModel = TimeNowViewModel()

    init() {
        #if DEBUG
        if CommandLine.arguments.contains("-enable-testing") {
            _timeNowModel = StateObject(wrappedValue: TimeNowViewModel.makeForTesting())
        }
        #endif
    }

    var body: some View {
        TabView {
            TimeNowView(viewModel: timeNowModel)
                .tabItem {
                    Image(systemName: "clock")
                    Text("Now")
                }

            TimeInputView(date: timeNowModel.currentDate)
                .tabItem {
                    Image(systemName: "arrow.up.arrow.down.circle")
                    Text("Set time")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
