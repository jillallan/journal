//
//  Visit.swift
//  Journal
//
//  Created by Jill Allan on 12/06/2023.
//

import Foundation
import SwiftData

@Model
class Visit {
    var title: String
    @Attribute(.unique)
    var arrivalDate: Date
    var departureDate: Date
    var step: Step?
    var trip: Trip?
    
    init(title: String, arrivalDate: Date, departureDate: Date) {
        self.title = title
        self.arrivalDate = arrivalDate
        self.departureDate = departureDate
    }
}
