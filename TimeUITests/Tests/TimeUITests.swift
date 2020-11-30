//
//  TimeUITests.swift
//  TimeUITests
//
//  Created by Maris Lagzdins on 30/11/2020.
//

@testable
import Time
import XCTest

class TimeUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testNowScreen() {
        // Given test models
        let components = DateComponents(year: 2020, month: 1, day: 1, hour: 23, minute: 45)
        let testModel = Self.makeTimeNowTestModel(using: components, startTimerAutomatically: false)

        let app = launch(appWithTestModel: testModel)

        // Verify "Now" screen
        XCTAssertTrue(app.tabBars.buttons["Now"].isSelected)
        XCTAssertEqual(app.staticTexts["separator-view.caption.top"].label, "(12 hours)")
        XCTAssertEqual(app.staticTexts["separator-view.caption.bottom"].label, "(24 hours)")
        XCTAssertEqual(app.staticTexts["time-now.12-hour-format"].label, "11:45 PM")
        XCTAssertEqual(app.staticTexts["time-now.24-hour-format"].label, "23:45")
    }

    func testSetTimePickersUpdatesWhenOneOfThemIsChanged() {
        // Given test models
        let components = DateComponents(year: 2020, month: 1, day: 1, hour: 23, minute: 45)
        let testModel = Self.makeTimeNowTestModel(using: components, startTimerAutomatically: false)

        let app = launch(appWithTestModel: testModel)

        // Verify "Set time" is not selected at first
        XCTAssertFalse(app.tabBars.buttons["Set time"].isSelected)

        // Switch to the "Set time" screen
        app.tabBars.buttons["Set time"].tap()

        // Verify "Set time" screen
        XCTAssertTrue(app.tabBars.buttons["Set time"].isSelected)
        XCTAssertEqual(app.staticTexts["separator-view.caption.top"].label, "(12 hours)")
        XCTAssertEqual(app.staticTexts["separator-view.caption.bottom"].label, "(24 hours)")

        // Verify that the initial date is the same as passed in
        let topPicker = app.datePickers["time-input.picker.top"]
        let bottomPicker = app.datePickers["time-input.picker.bottom"]

        XCTAssertEqual(topPicker.pickerWheels.element(boundBy: 0).value as? String, "11 o’clock")
        XCTAssertEqual(topPicker.pickerWheels.element(boundBy: 1).value as? String, "45 minutes")
        XCTAssertEqual(topPicker.pickerWheels.element(boundBy: 2).value as? String, "PM")

        XCTAssertEqual(bottomPicker.pickerWheels.element(boundBy: 0).value as? String, "23 o’clock")
        XCTAssertEqual(bottomPicker.pickerWheels.element(boundBy: 1).value as? String, "45 minutes")
        XCTAssertEqual(bottomPicker.pickerWheels.element(boundBy: 2).exists, false)

        // Change time in 12-hour picker
        topPicker.pickerWheels.element(boundBy: 0).adjust(toPickerWheelValue: "1")
        topPicker.pickerWheels.element(boundBy: 1).adjust(toPickerWheelValue: "20")
        topPicker.pickerWheels.element(boundBy: 2).adjust(toPickerWheelValue: "AM")

        // Need to wait for the picker-wheel animation to finish
        sleep(1)

        // Test that 24-hour picker reacts to changes
        XCTAssertEqual(bottomPicker.pickerWheels.element(boundBy: 0).value as? String, "01 o’clock")
        XCTAssertEqual(bottomPicker.pickerWheels.element(boundBy: 1).value as? String, "20 minutes")

        // Change time in 24-hour picker
        bottomPicker.pickerWheels.element(boundBy: 0).adjust(toPickerWheelValue: "14")
        bottomPicker.pickerWheels.element(boundBy: 1).adjust(toPickerWheelValue: "05")

        // Need to wait for the picker-wheel animation to finish
        sleep(1)

        // Test that 12-hour picker reacts to changes
        XCTAssertEqual(topPicker.pickerWheels.element(boundBy: 0).value as? String, "2 o’clock")
        XCTAssertEqual(topPicker.pickerWheels.element(boundBy: 1).value as? String, "05 minutes")
        XCTAssertEqual(topPicker.pickerWheels.element(boundBy: 2).value as? String, "PM")
    }

    func testTimerInNowScreenUpdatesDateTime() {
        // Given test models
        let components = DateComponents(year: 2020, month: 1, day: 1, hour: 12, minute: 59, second: 59)
        let testModel = Self.makeTimeNowTestModel(using: components, startTimerAutomatically: true)

        let app = launch(appWithTestModel: testModel)

        // Create expectations
        let predicate1 = NSPredicate(format: "label != '12:59 PM'")
        let predicate2 = NSPredicate(format: "label != '12:59'")
        let expectation1 = expectation(for: predicate1, evaluatedWith: app.staticTexts["time-now.12-hour-format"], handler: nil)
        let expectation2 = expectation(for: predicate2, evaluatedWith: app.staticTexts["time-now.24-hour-format"], handler: nil)

        // Wait for the expectations
        let result = XCTWaiter.wait(for: [expectation1, expectation2], timeout: 5)

        XCTAssertEqual(result, .completed)
    }
}

private extension TimeUITests {
    func launch(appWithTestModel testModel: String) -> XCUIApplication {
        // Launch application
        let app = XCUIApplication()
        app.launchArguments = ["-enable-testing"]
        app.launchEnvironment = [
            "TimeNowViewModel": testModel
        ]
        app.launch()
        return app
    }
}

extension TimeUITests {
    static func makeTimeNowTestModel(using components: DateComponents, startTimerAutomatically: Bool) -> String {
        let date = Calendar.current.date(from: components)!

        let testModel = TimeNowTestModel(date: date, startTimerAutomatically: startTimerAutomatically)
        let encoder = JSONEncoder()

        return try! encoder.encode(testModel).base64EncodedString()
    }
}
