//
//  ContentView.swift
//  Journal
//
//  Created by Jill Allan on 06/06/2023.
//

// TODO: Refactor as tab view and create Trips View

import OSLog
import SwiftUI
import SwiftData

struct ContentView: View {
    
    private static let logger = Logger(
        subsystem: Bundle.main.bundleIdentifier!,
        category: String(describing: ContentView.self)
    )
    
    @Environment(\.modelContext) private var modelContext
    @Query private var trips: [Trip]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(trips) { trip in
                    NavigationLink {
                        TripView(trip: trip)
                    } label: {
                        Text(trip.title)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            Self.logger.debug("Adding Trip")
            let newTrip = Trip(title: "Greece", startDate: Date.now, endDate: Date.now)
            modelContext.insert(newTrip)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(trips[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(ModelContextPreview.preview.modelContainer)
//        .modelContainer(for: [Trip.self, Step.self], inMemory: true)
}
