//
//  TimeWidget.swift
//  TimeWidget
//
//  Created by Maris Lagzdins on 04/12/2020.
//  Copyright © 2020 Maris Lagzdins. All rights reserved.
//

import WidgetKit
import SwiftUI

@main
struct ToTimeWidgets: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        TimeNowWidget()
        TimeAMPMWidget()
    }
}
