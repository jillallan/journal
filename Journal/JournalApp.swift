//
//  JournalApp.swift
//  Journal
//
//  Created by Jill Allan on 06/06/2023.
//

import SwiftUI
import SwiftData

@main
struct JournalApp: App {
    

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Trip.self, Step.self])
    }
}
