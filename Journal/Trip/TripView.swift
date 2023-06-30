//
//  TripView.swift
//  Journal
//
//  Created by Jill Allan on 06/06/2023.
//

import CoreLocation
import MapKit
import SwiftData
import SwiftUI
import OSLog

struct TripView: View {
    
    private let logger = Logger(
        subsystem: Bundle.main.bundleIdentifier!,
        category: String(describing: TripView.self)
    )
    
    @Environment(\.modelContext) private var modelContext
    
    @State private var isAddStepViewPresented: Bool = false
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.mainWindowSize) private var windowSize
    
    
    let trip: Trip
    let steps: [Step]
    
    let screenSize = UIScreen.main.bounds.height
    
//    @State private var mainID: PersistentIdentifier?
    @State private var scrolledID: Step.ID?
    
    private var edge: Edge {
        horizontalSizeClass == .compact ? .bottom : .leading
    }
    
//    private var windowAspectRatio: Double {
//        windowSize.width / windowSize.height
//    }
    
    var body: some View {
        
        GeometryReader { proxy in
            
//            let _ = logger.debug("scrolledID: \(String(describing: scrolledID))")
            VStack {
                TripMap(trip: trip, steps: steps, coordinates: steps.map(\.locationCoordinate), scrolledID: $scrolledID)
                    .safeAreaInset(edge: .bottom) {
                        StepScrollView(scrolledID: $scrolledID, steps: steps)
                    }
            }
            .environment(\.windowSize, proxy.size)
        }
        
        
        // MARK: - Navigation
        .navigationTitle(trip.title)
        .toolbar {
            ToolbarItem {
                Button {
                    isAddStepViewPresented.toggle()
                } label: {
                    Label("Add Step", systemImage: "plus")
                }
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .sheet(isPresented: $isAddStepViewPresented) {
            AddStepView(trip: trip)
        }
    }
}

private struct WindowSizeKey: EnvironmentKey {
    static let defaultValue: CGSize = .zero
}

extension EnvironmentValues {
    var windowSize: CGSize {
        get { self[WindowSizeKey.self] }
        set { self[WindowSizeKey.self] = newValue }
    }
}



struct TripView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TripView(trip: .preview, steps: Trip.preview.tripSteps)
                .modelContainer(previewContainer)
        }
    }
}

