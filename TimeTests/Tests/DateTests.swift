//
//  DateTests.swift
//  TimeTests
//
//  Created by Maris Lagzdins on 09/12/2020.
//  Copyright © 2020 Maris Lagzdins. All rights reserved.
//

@testable
import Time
import XCTest

class DateTests: XCTestCase {
    func testMidnightContainsCorrectTime() {
        // Given
        let givenComponents = DateComponents(year: 2020, month: 1, day: 1, hour: 9, minute: 41, second: 0)
        let resultComponents = DateComponents(year: 2020, month: 1, day: 1, hour: 0, minute: 0, second: 0)
        let sut = Calendar.current.date(from: givenComponents)!

        // When
        let date = sut.midnight()

        // Then
        XCTAssertTrue(Calendar.current.date(date, matchesComponents: resultComponents))
    }

    func testMiddayContainsCorrectTime() {
        // Given
        let givenComponents = DateComponents(year: 2020, month: 1, day: 1, hour: 9, minute: 41, second: 0)
        let resultComponents = DateComponents(year: 2020, month: 1, day: 1, hour: 12, minute: 0, second: 0)
        let sut = Calendar.current.date(from: givenComponents)!

        // When
        let date = sut.midday()

        // Then
        XCTAssertTrue(Calendar.current.date(date, matchesComponents: resultComponents))
    }

    func testNextMidnightContainsCorrectTimeAndDate() {
        // Given
        let givenComponents = DateComponents(year: 2020, month: 1, day: 1, hour: 9, minute: 41, second: 0)
        let resultComponents = DateComponents(year: 2020, month: 1, day: 2, hour: 0, minute: 0, second: 0)
        let sut = Calendar.current.date(from: givenComponents)!

        // When
        let date = sut.nextMidnight()

        // Then
        XCTAssertTrue(Calendar.current.date(date, matchesComponents: resultComponents))
    }

    func testNextMidnightContainsCorrectTimeAndDateForDateAtTheEndOfTheMonth() {
        // Given
        let givenComponents = DateComponents(year: 2020, month: 1, day: 31, hour: 9, minute: 41, second: 0)
        let resultComponents = DateComponents(year: 2020, month: 2, day: 1, hour: 0, minute: 0, second: 0)
        let sut = Calendar.current.date(from: givenComponents)!

        // When
        let date = sut.nextMidnight()

        // Then
        XCTAssertTrue(Calendar.current.date(date, matchesComponents: resultComponents))
    }

    func testMinutesInOrdinaryDay() {
        // Given
        let givenComponents = DateComponents(timeZone: TimeZone(abbreviation: "EET"), year: 2020, month: 1, day: 31, hour: 9, minute: 41, second: 0)
        let sut = Calendar.current.date(from: givenComponents)!

        // When
        let minutes = sut.minutesInTotal()

        // Then
        XCTAssertEqual(minutes, 1440)
    }

    func testMinutesInDaylightSavingDate() {
        // Given
        let givenComponents = DateComponents(timeZone: TimeZone(abbreviation: "EET"), year: 2020, month: 10, day: 25, hour: 9, minute: 41, second: 0)
        let sut = Calendar.current.date(from: givenComponents)!

        // When
        let minutes = sut.minutesInTotal()

        // Then
        XCTAssertEqual(minutes, 1500)
    }
}
