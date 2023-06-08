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
    var trip: Trip
    
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
        self.date = date
        self.locationCoordinate = locationCoordinate
        
        Self.logger.log(level: .default, "Item created \(date, privacy: .public)")
    }
}

extension CLLocationCoordinate2D: Encodable, Decodable {
    enum CodingKeys: CodingKey {
        case latitude
        case longitude
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init()
        latitude = try container.decode(Double.self, forKey: .latitude)
        longitude = try container.decode(Double.self, forKey: .longitude)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(latitude, forKey: .latitude)
        try container.encode(longitude, forKey: .longitude)
    }
}
