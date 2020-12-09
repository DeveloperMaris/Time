//
//  DateFormatterTests.swift
//  TimeTests
//
//  Created by Maris Lagzdins on 03/12/2020.
//  Copyright © 2020 Maris Lagzdins. All rights reserved.
//

@testable
import Time
import XCTest

class DateFormatterTests: XCTestCase {
    func test12HourDateFormatterFormat() {
        // Given
        let dateFormat = "h:mm a"

        // Then
        XCTAssertEqual(DateFormatter.for12hours.dateFormat, dateFormat)
    }

    func test12HourDateFormatterLocale() {
        // Given
        let locale = "en_US"

        // Then
        XCTAssertEqual(DateFormatter.for12hours.locale.identifier, locale)
    }

    func test24HourDateFormatterFormat() {
        // Given
        let dateFormat = "HH:mm"

        // Then
        XCTAssertEqual(DateFormatter.for24hours.dateFormat, dateFormat)
    }

    func test24HourDateFormatterLocale() {
        // Given
        let locale = "en_US"

        // Then
        XCTAssertEqual(DateFormatter.for24hours.locale.identifier, locale)
    }

    func testDateIsDisplayedIn12HourFormat() {
        // Given
        let components = DateComponents(year: 2020, month: 1, day: 1, hour: 14, minute: 41, second: 14)
        let date = Calendar.current.date(from: components)!

        // When
        let formattedDate = DateFormatter.for12hours.string(from: date)

        // Then
        XCTAssertEqual(formattedDate, "2:41 PM")
    }

    func testDateIsDisplayedIn24HourFormat() {
        // Given
        let components = DateComponents(year: 2020, month: 1, day: 1, hour: 14, minute: 41, second: 14)
        let date = Calendar.current.date(from: components)!

        // When
        let formattedDate = DateFormatter.for24hours.string(from: date)

        // Then
        XCTAssertEqual(formattedDate, "14:41")
    }
}
