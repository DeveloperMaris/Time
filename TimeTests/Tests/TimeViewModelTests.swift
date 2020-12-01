//
//  TimeViewModelTests.swift
//  TimeTests
//
//  Created by Maris Lagzdins on 26/11/2020.
//  Copyright © 2020 Maris Lagzdins. All rights reserved.
//

@testable
import Time
import XCTest

class TimeViewModelTests: XCTestCase {
    func test12HourDateFormatterFormat() {
        // Given
        let dateFormat = "h:mm a"

        // Then
        XCTAssertEqual(TimeNowViewModel.dateFormatterFor12hours.dateFormat, dateFormat)
    }

    func test12HourDateFormatterLocale() {
        // Given
        let locale = "en_US"

        // Then
        XCTAssertEqual(TimeNowViewModel.dateFormatterFor12hours.locale.identifier, locale)
    }

    func test24HourDateFormatterFormat() {
        // Given
        let dateFormat = "HH:mm"

        // Then
        XCTAssertEqual(TimeNowViewModel.dateFormatterFor24hours.dateFormat, dateFormat)
    }

    func test24HourDateFormatterLocale() {
        // Given
        let locale = "en_US"

        // Then
        XCTAssertEqual(TimeNowViewModel.dateFormatterFor24hours.locale.identifier, locale)
    }

    func testCurrentDateIsNow() {
        // Given
        let calendar = Calendar.current
        let date = Date()
        let components: Set<Calendar.Component> = [.hour, .minute]
        let providedComponents = calendar.dateComponents(components, from: date)

        // When
        let sut = TimeNowViewModel()

        // Then
        let modelComponents = calendar.dateComponents(components, from: sut.currentDate)
        XCTAssertEqual(modelComponents, providedComponents)
    }

    func testCurrentDateUpdates() {
        // Given
        let sut = TimeNowViewModel()
        let newDate = sut.currentDate.addingTimeInterval(60)

        // When
        sut.set(date: newDate)

        // Then
        XCTAssertEqual(sut.currentDate, newDate)
    }

    func testDateIsDisplayedIn12HourFormat() {
        // Given
        let calendar = Calendar.current
        let components = DateComponents(year: 2020, month: 1, day: 1, hour: 14, minute: 41, second: 14)
        let date = calendar.date(from: components)!

        // When
        let formattedDate = TimeNowViewModel.dateFormatterFor12hours.string(from: date)

        // Then
        XCTAssertEqual(formattedDate, "2:41 PM")
    }

    func testDateIsDisplayedIn24HourFormat() {
        // Given
        let calendar = Calendar.current
        let components = DateComponents(year: 2020, month: 1, day: 1, hour: 14, minute: 41, second: 14)
        let date = calendar.date(from: components)!

        // When
        let formattedDate = TimeNowViewModel.dateFormatterFor24hours.string(from: date)

        // Then
        XCTAssertEqual(formattedDate, "14:41")
    }
}
