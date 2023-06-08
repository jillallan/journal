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
                title: "Russia",
                startDate: dateFormatter.date(from: "31/07/2016 13:00:00") ?? Date.now,
                endDate: dateFormatter.date(from: "16/08/2023 19:00:00") ?? Date.now
            )
        ]
        return trips
    }
}
