//
//  ModelContextPreview.swift
//  Journal
//
//  Created by Jill Allan on 07/06/2023.
//

import Foundation
import SwiftData

class ModelContextPreview {
    
    let modelContext: ModelContext
    let modelContainer: ModelContainer
    let modelConfiguarion: ModelConfiguration
    
    init() {
        modelConfiguarion = ModelConfiguration(inMemory: true)
        
        do {
            modelContainer = try ModelContainer(for: [Trip.self, Step.self], modelConfiguarion)
            modelContext = ModelContext(modelContainer)
        } catch {
            fatalError()
        }
    }
    
    static var preview: ModelContextPreview = {
        let modelContextPreview = ModelContextPreview()
        return modelContextPreview
    }()
}
