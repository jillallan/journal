//
//  Step-Preview.swift
//  Journal
//
//  Created by Jill Allan on 08/06/2023.
//

import CoreLocation
import Foundation
import SwiftData

extension Step {
    
    @MainActor
    static var preview: Step = {
        previews[1]
    }()


    @MainActor
    static var previews: [Step] = {
        let fetchDescriptor = FetchDescriptor<Step>()
        do {
            let steps = try PreviewContainer.previewContainer.mainContext.fetch(fetchDescriptor)
            return steps
        } catch {
            fatalError("Error fetching steps in Step Preview: \(error.localizedDescription)")
        }
        
    }()
    
    static func createSampleSteps(modelContext: ModelContext, trips: [Trip]) -> [Step] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy HH:mm:ss"
        
        let trip1 = [
            Step(
                 date: dateFormatter.date(from: "27/03/16 08:00:00") ?? Date.now,
                 locationCoordinate: CLLocationCoordinate2D(latitude: 51.436027524806505, longitude: -2.597474502627349)
            ), // st johns lane
            Step(
                 date: dateFormatter.date(from: "28/07/16 08:06:00") ?? Date.now,
                 locationCoordinate: CLLocationCoordinate2D(latitude: 51.44068104780135, longitude: -2.593542287284705)
            ), // bedminster station
            Step(
                 date: dateFormatter.date(from: "28/07/16 08:27:00") ?? Date.now,
                 locationCoordinate: CLLocationCoordinate2D(latitude: 51.44968763781848, longitude: -2.583955816119858)
            ), // temple meads
            Step(
                 date: dateFormatter.date(from: "28/07/16 09:00:00") ?? Date.now,
                 locationCoordinate: CLLocationCoordinate2D(latitude: 51.51665855433426, longitude: -0.17693891259975664)
            ), // paddington
            Step(
                 date: dateFormatter.date(from: "28/07/16 11:06:00") ?? Date.now,
                 locationCoordinate: CLLocationCoordinate2D(latitude: 51.531016132570095, longitude: -0.1258159891295469)
            ), // st pancras
            Step(
                 date: dateFormatter.date(from: "28/07/16 16:00:00") ?? Date.now,
                 locationCoordinate: CLLocationCoordinate2D(latitude: 50.83732515430105, longitude: 4.336163006589926)
            ), // brussels
            Step(
                 date: dateFormatter.date(from: "29/07/16 16:04:00") ?? Date.now,
                 locationCoordinate: CLLocationCoordinate2D(latitude: 50.94422085164347, longitude: 6.95845268633846)
            ), // cologne
            Step(
                 date: dateFormatter.date(from: "30/07/16 10:19:00") ?? Date.now,
                 locationCoordinate: CLLocationCoordinate2D(latitude: 52.22984083006616, longitude: 21.003125966064793)
            ), // warsaw
        ]
        
        _ = trip1.map { step in
            step.trip = trips.first(where: { trip in
                trip.title == "Bedminster to Moscow"
            })
            
            modelContext.insert(step)
        }
        
        return trip1
    }
}
