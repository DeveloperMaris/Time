//
//  ProvidedTimeView.swift
//  Time
//
//  Created by Maris Lagzdins on 01/11/2020.
//  Copyright © 2020 Maris Lagzdins. All rights reserved.
//

import SwiftUI

struct TimeInputView: View {
    @State var date: Date

    init(date: Date) {
        _date = State(wrappedValue: date)
    }

    var body: some View {
        VStack {
            DatePicker("Please set time in 12 hour format", selection: $date, displayedComponents: .hourAndMinute)
                .environment(\.locale, Locale(identifier: "en_US"))
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
                .accessibilityIdentifier("time-input.picker.top")
            
            SeparatorView(topCaption: "(12 hours)", bottomCaption: "(24 hours)")
            
            DatePicker("Please set time in 24 hour format", selection: $date, displayedComponents: .hourAndMinute)
                .environment(\.locale, Locale(identifier: "en_GB"))
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
                .accessibilityIdentifier("time-input.picker.bottom")
        }
    }
}

struct ProvidedTimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeInputView(date: Date())
    }
}
