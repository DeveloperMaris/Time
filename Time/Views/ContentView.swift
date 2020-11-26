//
//  ContentView.swift
//  Time
//
//  Created by Maris Lagzdins on 25/11/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TimeNowView()
                .tabItem {
                    Image(systemName: "clock")
                    Text("Now")
                }

            TimeInputView()
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
