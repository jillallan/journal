//
//  Step-Preview.swift
//  Journal
//
//  Created by Jill Allan on 08/06/2023.
//

import CoreLocation
import Foundation
import SwiftData

extension Step {
    
    static var previewSteps: [Step] = {
        createSampleSteps()
    }()
    
    static func createSampleSteps() -> [Step] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy hh:mm:ss"
        
        let steps = [
            Step(
                 date: dateFormatter.date(from: "27/03/23 08:00:00") ?? Date.now,
                 locationCoordinate: CLLocationCoordinate2D(latitude: 51.45906, longitude: -2.59311)
            ),
            Step(
                 date: dateFormatter.date(from: "27/03/23 09:10:00") ?? Date.now,
                 locationCoordinate: CLLocationCoordinate2D(latitude: 51.44979, longitude: -2.58065)
            ),
            Step(
                 date: dateFormatter.date(from: "27/03/23 09:10:00") ?? Date.now,
                 locationCoordinate: CLLocationCoordinate2D(latitude: 51.42658, longitude: -2.56367)
            ),
            Step(
                 date: dateFormatter.date(from: "27/03/23 09:20:00") ?? Date.now,
                 locationCoordinate: CLLocationCoordinate2D(latitude: 51.41355, longitude: -2.55993)
            ),
            Step(
                 date: dateFormatter.date(from: "27/03/23 09:30:00") ?? Date.now,
                 locationCoordinate: CLLocationCoordinate2D(latitude: 51.39497, longitude: -2.54958)
            ),
            Step(
                 date: dateFormatter.date(from: "27/03/23 09:35:00") ?? Date.now,
                 locationCoordinate: CLLocationCoordinate2D(latitude: 51.37716, longitude: -2.55262)
            ),
            Step(
                 date: dateFormatter.date(from: "27/03/23 09:40:00") ?? Date.now,
                 locationCoordinate: CLLocationCoordinate2D(latitude: 51.37162, longitude: -2.55005)
            ),
            Step(
                 date: dateFormatter.date(from: "27/03/23 11:05:00") ?? Date.now,
                 locationCoordinate: CLLocationCoordinate2D(latitude: 51.37162, longitude: -2.55005)
            ),
        ]
        return steps
    }
}
