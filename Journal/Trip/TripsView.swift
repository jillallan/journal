//
//  TripsView.swift
//  Journal
//
//  Created by Jill Allan on 06/06/2023.
//

// TODO: Refactor as tab view and create Trips View

import OSLog
import SwiftUI
import SwiftData

struct TripsView: View {
    
    private static let logger = Logger(
        subsystem: Bundle.main.bundleIdentifier!,
        category: String(describing: TripsView.self)
    )
    
    @Environment(LocationHandler.self) private var locationHandler
    
    @Environment(\.modelContext) private var modelContext
    @Query private var trips: [Trip]
    
    @State private var isAddTripViewPresented: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(trips) { trip in
                    NavigationLink {
                        TripView(trip: trip, steps: trip.tripSteps)
                    } label: {
                        Text(trip.title)
                            .badge(trip.steps?.count ?? 0)
                            .badgeProminence(.increased)
                    }
                }
                .onDelete(perform: deleteItems)
                Button {
                    locationHandler.updatesStarted ? locationHandler.stopLocationUpdates() : locationHandler.startLocationUpdates()
                } label: {
                    Label("Start Location Services", systemImage: "map")
                }
                Text("Last location \(locationHandler.lastLocation)")

            }
            .navigationTitle("Trips")
            
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    Button {
                        isAddTripViewPresented.toggle()
                    } label: {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $isAddTripViewPresented) {
                AddTripView()
            }
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

struct TripsView_Previews: PreviewProvider {
    static var previews: some View {
        TripsView()
            .modelContainer(PreviewContainer.previewContainer)
    }
}
