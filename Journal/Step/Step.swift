//
//  Step.swift
//  Journal
//
//  Created by Jill Allan on 06/06/2023.
//

import CoreLocation
import Foundation
import OSLog
import SwiftData

@Model
class Step {
    
    private static let logger = Logger(
        subsystem: Bundle.main.bundleIdentifier!,
        category: String(describing: Step.self)
    )
    
    var date: Date
    var locationCoordinate: CLLocationCoordinate2D
    var altitude: Double = 0.0
    var horizontalAccuracy: Double = 0.0
    var verticalAccuracy: Double = 0.0
    var day: Date
    var trip: Trip?
    
//    var visit: Visit?
//    var journey: Journey?
//    var placemark: Placemark?
    
    var stepTitle: String {
        date.formatted(date: .abbreviated, time: .shortened)
        
//        Date.FormatStyle(date: .numeric, time: .standard)
    }
    
    /// Create a new step
    ///
    /// Use this to create a new step, then add it to the modelContext
    /// ```swift
    ///let newStep = Step(
    ///    date: Date.now,
    ///    locationCoordinate: CLLocationCoordinate2D(
    ///        latitude: 51.5,
    ///        longitude: 0.0
    ///    )
    ///)
    ///
    ///modelContext.insert(newStep)
    /// ```
   
    init(date: Date, locationCoordinate: CLLocationCoordinate2D) {
//        id = UUID()
        self.date = date
        self.locationCoordinate = locationCoordinate
        altitude = 0.0
        horizontalAccuracy = 0.0
        verticalAccuracy = 0.0
        day = Calendar.current.startOfDay(for: date)
        
        Self.logger.log(level: .default, "Item created \(date, privacy: .public)")
    }
}

extension Step: Comparable {
    public static func < (lhs: Step, rhs: Step) -> Bool {
        lhs.date < rhs.date
    }
}
