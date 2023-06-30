//
//  LocationHandler.swift
//  Journal
//
//  Created by Jill Allan on 28/06/2023.
//


import os
import SwiftUI
import CoreLocation


@Observable
class LocationHandler {
    let logger = Logger(subsystem: "com.apple.liveUpdatesSample", category: "LocationsHandler")

    @ObservationIgnored
    private let manager: CLLocationManager

    var lastLocation = CLLocation()
    var count = 0
    var isStationary = false
    
    @ObservationIgnored
    @AppStorage("liveUpdatesStarted") var updatesStarted: Bool = false
    
    init() {
        manager = CLLocationManager()  // Creating a location manager instance is safe to call here in `MainActor`.
    }
    
    func startLocationUpdates() {
        if manager.authorizationStatus == .notDetermined {
            manager.requestWhenInUseAuthorization()
        }
        updatesStarted = true
        
        logger.info("Starting location updates")

        Task {
            await processLocationUpdates()
        }
    }
    
    func stopLocationUpdates() {
        self.logger.info("Stopping location updates")
        self.updatesStarted = false
    }
    
    @MainActor
    func processLocationUpdates() async {

        let updates = CLLocationUpdate.liveUpdates()
        
        do {
            for try await update in updates {
                if !updatesStarted { break }  // End location updates by breaking out of the loop.
                
                if let loc = update.location {
                    self.lastLocation = loc
                    isStationary = update.isStationary
                    count += 1
                    logger.info("Location \(self.count): \(self.lastLocation)")
                }
            }
        } catch {
            logger.error("Could not start location updates")
        }
    }
}

