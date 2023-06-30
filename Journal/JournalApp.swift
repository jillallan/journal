//
//  JournalApp.swift
//  Journal
//
//  Created by Jill Allan on 06/06/2023.
//

import os
import SwiftUI
import SwiftData

@main
struct JournalApp: App {
    
    let logger = Logger(
        subsystem: "com.apple.liveUpdatesSample", category: "LiveUpdatesApp"
    )
    
    @State private var locationHandler = LocationHandler()
    
    init() {
        if locationHandler.updatesStarted {
            self.logger.info("Restart liveUpdates Session")
            locationHandler.startLocationUpdates()
        }
    }
    
    var body: some Scene {
        
        WindowGroup {
            GeometryReader { proxy in
                ContentView()
                    .environment(\.mainWindowSize, proxy.size)
                    .environment(locationHandler)
            }
        }
        .modelContainer(for: [Trip.self], inMemory: true) { result in
            switch result {
            case .success(let container):
                SampleData.createData(modelContext: container.mainContext)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

private struct MainWindowSizeKey: EnvironmentKey {
    static let defaultValue: CGSize = .zero
}

enum Orientation {
    case portrait
    case landscape
}

private struct WindowOrientationKey: EnvironmentKey {
    static let defaultValue: Orientation = .portrait
}

extension EnvironmentValues {
    var mainWindowSize: CGSize {
        get { self[MainWindowSizeKey.self] }
        set { self[MainWindowSizeKey.self] = newValue }
    }
    
    var windowOrientation: Orientation {
        get { self[WindowOrientationKey.self] }
        set { self[WindowOrientationKey.self] = newValue }
    }
}

