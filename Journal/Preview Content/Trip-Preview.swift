//
//  Trip-Preview.swift
//  Journal
//
//  Created by Jill Allan on 07/06/2023.
//

import Foundation
import SwiftData

extension Trip {
    
    
    static var previewTrips: [Trip] = {
        createSampleTrips()
    }()


    
    static func createSampleTrips() -> [Trip] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy hh:mm:ss"
        
        let trips: [Trip] = [
            Trip(
                title: "Bedminster to Moscow",
                startDate: dateFormatter.date(from: "28/03/16 08:00:00") ?? Date.now,
                endDate: dateFormatter.date(from: "31/03/16 12:00:00") ?? Date.now
            ),
            Trip(
                title: "Athens and the Cyclades",
                startDate: dateFormatter.date(from: "12/05/2023 13:00:00") ?? Date.now,
                endDate: dateFormatter.date(from: "28/05/2023 19:00:00") ?? Date.now
            )
        ]
        return trips
    }
}
