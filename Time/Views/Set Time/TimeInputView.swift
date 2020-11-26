//
//  ProvidedTimeView.swift
//  Time
//
//  Created by Maris Lagzdins on 01/11/2020.
//

import SwiftUI

struct TimeInputView: View {
    @State private var date = Date()
    
    var body: some View {
        VStack {
            DatePicker("Please set time in 12 hour format", selection: $date, displayedComponents: .hourAndMinute)
                .environment(\.locale, Locale(identifier: "en_US"))
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
            
            SeparatorView(topCaption: "(12 hours)", bottomCaption: "(24 hours)")
            
            DatePicker("Please set time in 24 hour format", selection: $date, displayedComponents: .hourAndMinute)
                .environment(\.locale, Locale(identifier: "en_GB"))
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
        }
    }
}

struct ProvidedTimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeInputView()
    }
}
