//
//  LoggerExtension.swift
//  Time
//
//  Created by Maris Lagzdins on 26/11/2020.
//

import Foundation
import os.log

extension Logger {
    private static var subsystem = Bundle.main.bundleIdentifier!

    static func make(category: String) -> Logger {
        Logger(subsystem: Self.subsystem, category: category)
    }
}
