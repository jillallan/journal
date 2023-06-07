//
//  TripView.swift
//  Journal
//
//  Created by Jill Allan on 06/06/2023.
//

import CoreLocation
import SwiftData
import SwiftUI

struct TripView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var steps: [Step]
    
    let trip: Trip
    
    var body: some View {
        List {
            ForEach(steps) { step in
                HStack {
                    Text(step.locationCoordinate.latitude, format: .number)
                    Text(step.locationCoordinate.longitude, format: .number)
                }
            }
            .onDelete(perform: deleteItems)
        }
        .navigationTitle(trip.title)
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
    }
    private func addItem() {
        withAnimation {
            let newStep = Step(
                date: Date.now,
                locationCoordinate: CLLocationCoordinate2D(
                    latitude: 51.5, longitude: 0.0
                )
            )
            
            modelContext.insert(newStep)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(steps[index])
            }
        }
    }
}

#Preview {
    TripView(trip: Trip(title: "Greece", startDate: Date.now, endDate: Date.now))
        .modelContainer(for: Step.self, inMemory: true)
}
