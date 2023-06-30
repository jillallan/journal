//
//  Trip-Preview.swift
//  Journal
//
//  Created by Jill Allan on 07/06/2023.
//

import Foundation
import SwiftData

extension Trip {
    
    @MainActor
    static var preview: Trip = {
        previews[1]
    }()


    @MainActor
    static var previews: [Trip] = {
        let fetchDescriptor = FetchDescriptor<Trip>()
        do {
            let trips = try PreviewContainer.previewContainer.mainContext.fetch(fetchDescriptor)
            return trips
        } catch {
            fatalError("Error fetching trip in Trip Preview: \(error.localizedDescription)")
        }
        
    }()
    
    static func createSampleTrips(modelContext: ModelContext) -> [Trip] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy hh:mm:ss"
        
        let trips: [Trip] = [
            Trip(
                title: "Bedminster to Moscow",
                startDate: dateFormatter.date(from: "28/07/16 08:00:00") ?? Date.now,
                endDate: dateFormatter.date(from: "31/07/16 12:00:00") ?? Date.now
            ),
            Trip(
                title: "Russia",
                startDate: dateFormatter.date(from: "31/07/2016 13:00:00") ?? Date.now,
                endDate: dateFormatter.date(from: "16/08/2023 19:00:00") ?? Date.now
            )
        ]
        
        _ = trips.map { trip in
            modelContext.insert(trip)
        }
        return trips
    }
}
