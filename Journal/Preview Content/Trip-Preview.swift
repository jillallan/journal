//
//  Trip-Preview.swift
//  Journal
//
//  Created by Jill Allan on 07/06/2023.
//

import Foundation
import SwiftData

extension Trip {
    
    
    
    func createSampleTrips(modelContext: ModelContext) -> [Trip] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy hh:mm:ss"
        
        
        
        let trips = [
            Trip(
                title: "Bedminster to Beijing",
                startDate: dateFormatter.date(from: "28/07/2016 09:00:00") ?? Date.now,
                endDate: dateFormatter.date(from: "31/07/2016 12:00:00") ?? Date.now
            ),
            Trip(
                title: "Athens and the Cyclades",
                startDate: dateFormatter.date(from: "12/05/2023 13:00:00") ?? Date.now,
                endDate: dateFormatter.date(from: "28/05/2023 19:00:00") ?? Date.now
            ),

        ]
        
        _ = trips.map { trip in
            modelContext.insert(object: trip)
        }
        
        return trips
    }
}
