//
//  CenterSeparator.swift
//  Time
//
//  Created by Maris Lagzdins on 26/11/2020.
//  Copyright © 2020 Maris Lagzdins. All rights reserved.
//

import SwiftUI

struct SeparatorView: View {
    let topCaption: String
    let bottomCaption: String
    
    var body: some View {
        VStack {
            Text(topCaption)
                .font(.caption)
                .italic()
                .accessibilityIdentifier("separator-view.caption.top")

            Color.primary
                .frame(width: 200, height: 1)
                .padding()

            Text(bottomCaption)
                .font(.caption)
                .italic()
                .accessibilityIdentifier("separator-view.caption.bottom")
        }
    }
}

struct SeparatorView_Previews: PreviewProvider {
    static var previews: some View {
        SeparatorView(topCaption: "(12 hours)", bottomCaption: "(24 hours)")
    }
}
