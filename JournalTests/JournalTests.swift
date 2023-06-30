//
//  JournalTests.swift
//  JournalTests
//
//  Created by Jill Allan on 06/06/2023.
//

import CoreLocation
import XCTest
@testable import Journal


final class JournalTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCLLocationCoordinate2DEncode_outputsDataObject() throws {
        // if
        let cllocationCoordinate2D = CLLocationCoordinate2D(latitude: Double.random(in: -180...180), longitude: Double.random(in: -180...180))
        let encoder = JSONEncoder()
        
        // when
        
        let data = try encoder.encode(cllocationCoordinate2D)
        print(type(of: data))
        print(data)
        
        // then
        XCTAssertTrue(type(of: data) == Data.self)

    }
    
    func testCLLocationCoordinate2DInitFromDecoder_outputsCLLocationCoordinate2D() throws {
        // if
        let cllocationCoordinate2D = CLLocationCoordinate2D(latitude: Double.random(in: -180...180), longitude: Double.random(in: -180...180))
        let encoder = JSONEncoder()
        let data = try encoder.encode(cllocationCoordinate2D)
        
        // when
        
        let decoder = JSONDecoder()
        let decodedLocationCoordinates = try decoder.decode(CLLocationCoordinate2D.self, from: data)
        
        // then
        XCTAssertEqual(decodedLocationCoordinates, cllocationCoordinate2D)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
