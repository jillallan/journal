//
//  AddStepView.swift
//  Journal
//
//  Created by Jill Allan on 09/06/2023.
//

import CoreLocation
import OSLog
import SwiftData
import SwiftUI

struct AddStepView: View {
    
    private static let logger = Logger(
        subsystem: Bundle.main.bundleIdentifier!,
        category: String(describing: AddStepView.self)
    )
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    let trip: Trip
    
    @State private var date: Date = Date.now
    @State private var latitude: Double = 0.0
    @State private var longitude: Double = 0.0
    
    var body: some View {
        Form {
            DatePicker("Time", selection: $date, displayedComponents: [.date, .hourAndMinute])
            TextField(value: $latitude, format: .number) {
                Text("Latitude")
            }
            TextField(value: $longitude, format: .number) {
                Text("Longitude")
            }
            
            Button {
                addStep(trip: trip)
                dismiss()
            } label: {
                Text("Add Step")
            }
        }
    }
    
    func addStep(trip: Trip) {
        
        let newStep = Step(date: date, locationCoordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
        newStep.trip = trip
        modelContext.insert(newStep)
        
    }
}

struct AddStepView_Previews: PreviewProvider {
    static var previews: some View {
        AddStepView(trip: .preview)
            .modelContainer(previewContainer)
            .previewDisplayName("unfilled")
        
        AddStepView(trip: .preview)
            .modelContainer(previewContainer)
            .previewDisplayName("Filled")
    }
}
//
//#Preview {
//    AddStepView(trip: Trip.previewTrip)
//} 160.887658888
