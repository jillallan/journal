//
//  JournalUITests.swift
//  JournalUITests
//
//  Created by Jill Allan on 06/06/2023.
//

import XCTest
//@testable import Journal

final class JournalUITests: BaseUITest {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func testExample2() throws {
        app.collectionViews.staticTexts["Bedminster to Moscow"].tap()
        let map = app.maps.element.exists
        print(String(describing: map))
    }

    func testAddTrip_AddsATripInTripsView() throws {

        // if
        let tripTitle = UITestHelper.randomString(length: 5)
        
        // when
        let addItemButton = app.navigationBars["Trips"].buttons["Add Item"]
        addItemButton.tap()
        app.collectionViews/*@START_MENU_TOKEN@*/.textFields["Trip Title"]/*[[".cells.textFields[\"Trip Title\"]",".textFields[\"Trip Title\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.typeText(tripTitle)
        app.buttons["Add Trip"].tap()
        
        let tripTitleExists = app.collectionViews.staticTexts[tripTitle].exists

        // then
        XCTAssertTrue(tripTitleExists, "Should find \(tripTitle) in list of trips")
    }
    
    func testAddStep_AddsAStepInStepsView() throws {
        
        // if
//        let latitude = String(format: "%.6f", Double.random(in: 0...180))
        
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 6
        
        let latitude = formatter.string(from: Double.random(in: 0...180) as NSNumber) ?? "0.0"
        let longitude = formatter.string(from: Double.random(in: 0...180) as NSNumber) ?? "0.0"
        
        // when
        app.collectionViews.staticTexts["Russia"].tap()
        app.navigationBars["Russia"].buttons["Add Step"].tap()
        app.collectionViews.textFields["Latitude"].tap()
        app.typeText(latitude)
        app.collectionViews.textFields["Longitude"].tap()
        app.typeText(longitude)
        app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Add Step"]/*[[".cells.buttons[\"Add Step\"]",".buttons[\"Add Step\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        // then
        let latitudeExists = app.collectionViews.staticTexts[latitude].exists
        let longitudeExists = app.collectionViews.staticTexts[longitude].exists

        XCTAssertTrue(latitudeExists && longitudeExists, "Should find \(latitude) and \(longitude) in list of trips")
    }

    override func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
