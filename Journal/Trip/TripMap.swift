//
//  TripMap.swift
//  Journal
//
//  Created by Jill Allan on 15/06/2023.
//

import CoreLocation
import MapKit
import OSLog
import SwiftData
import SwiftUI

struct TripMap: View {
    
    private let logger = Logger(
        subsystem: Bundle.main.bundleIdentifier!,
        category: String(describing: StepScrollView.self)
    )
    
    @Environment(\.modelContext) private var modelContext
    
    @State private var position: MapCameraPosition = .automatic
    @State private var visibleRegion: MKCoordinateRegion?
    @State private var selectedMarker: MKPointAnnotation?
    
    let trip: Trip
    let steps: [Step]
    let coordinates: [CLLocationCoordinate2D]
//    @Binding var mainID: PersistentIdentifier?
    @Binding var scrolledID: Step.ID?
    
    var body: some View {
        
        let _ = logger.log(level: .debug, "selected marker: \(String(describing: selectedMarker), privacy: .public)")
            
        
        Map(position: $position, selection: $selectedMarker) {
            ForEach(steps) { step in
                Marker("", coordinate: step.locationCoordinate)
                
//                Annotation("", coordinate: step.locationCoordinate) {
//                    Circle()
//                        .fill(.indigo)
//                        .frame(width: 12, height: 12)
//                    
//                }
                
            }
            MapPolyline(coordinates: coordinates)
                .stroke(.indigo, lineWidth: 5)
        }
        .mapStyle(.standard(elevation: .realistic))
//            .mapControls {
//
//            }
    
        .onMapCameraChange { context in
            visibleRegion = context.region
        }

        .onChange(of: scrolledID) { oldID, newID in
            updatePosition(oldID: oldID, newID: newID)
        }

    }
    
    func updatePosition(oldID: PersistentIdentifier?, newID: PersistentIdentifier?) {
        guard let step = steps.first(where: { $0.objectID == newID }) else { return }
        
        var mapRegionSteps = [step]
        
        if let previousStep = steps.previous(item: step) {
            mapRegionSteps.insert(previousStep, at: 0)
        }
        
        if let nextStep = steps.next(item: step) {
            mapRegionSteps.append(nextStep)
        }
        
        let span = calculateSpan(coordiantes: mapRegionSteps.map(\.locationCoordinate))
        
        withAnimation {
            position = .region(
                MKCoordinateRegion(center: step.locationCoordinate, span: span)
            )
        }
    }
    
    func calculateSpan(coordiantes: [CLLocationCoordinate2D]) -> MKCoordinateSpan {
        
        let averageLatitudeDifference = zip(coordiantes, coordiantes.dropFirst()).map { a, b in
            abs(a.latitude - b.latitude)
        }.reduce(0, +) / Double(coordiantes.count - 1)

        let averageLongitudeDifference = zip(coordiantes, coordiantes.dropFirst()).map { a, b in
            abs(a.latitude - b.latitude)
        }.reduce(0, +) / Double(coordiantes.count - 1)
        
        logger.debug("avg lat diff: \(averageLatitudeDifference)")
        logger.debug("avg lon diff: \(averageLongitudeDifference)")
        
        let span = MKCoordinateSpan(
            latitudeDelta: averageLatitudeDifference > 1 ? 0.8 : averageLatitudeDifference,
            longitudeDelta: averageLongitudeDifference > 1 ? 0.8 : averageLongitudeDifference
        )
        return span
    }
}


struct TripMap_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationStack {
            TripMap(trip: .preview, steps: Trip.preview.tripSteps, coordinates: Trip.preview.tripSteps.map(\.locationCoordinate), scrolledID: Binding.constant(Step.preview.id))
                .modelContainer(previewContainer)
        }
    }
}
