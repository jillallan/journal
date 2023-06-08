//
//  ModelContextPreview.swift
//  Journal
//
//  Created by Jill Allan on 07/06/2023.
//

import Foundation
import SwiftData

@MainActor

let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(
            for: [Step.self, Trip.self],
            ModelConfiguration(inMemory: true)
        )
        
        for trip in Trip.previewTrips {
            container.mainContext.insert(object: trip)
        }
        
        return container
        
    } catch {
        fatalError("error loading sample data: \(error.localizedDescription)")
    }
}()
