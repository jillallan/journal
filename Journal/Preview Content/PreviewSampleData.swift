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
        return container
        
    } catch {
        fatalError("error loading sample data: \(error.localizedDescription)")
    }
}()

@MainActor
struct PreviewContainer {
    static var previewContainer: ModelContainer = {
        do {
            let container = try ModelContainer(
                for: [Step.self, Trip.self],
                ModelConfiguration(inMemory: true)
            )
            
            SampleData.createData(modelContext: container.mainContext)

            return container
            
        } catch {
            fatalError("error loading sample data: \(error.localizedDescription)")
        }
    }()
}
