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
}
