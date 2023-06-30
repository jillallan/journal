//
//  SampleData.swift
//  Journal
//
//  Created by Jill Allan on 09/06/2023.
//

import Foundation
import SwiftData

struct SampleData {
    @MainActor
    static func createData(modelContext: ModelContext) {

        let trips = Trip.createSampleTrips(modelContext: modelContext)
        _ = Step.createSampleSteps(modelContext: modelContext, trips: trips)
        
    }
}
