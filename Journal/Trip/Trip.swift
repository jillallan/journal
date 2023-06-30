//
//  Trip.swift
//  Journal
//
//  Created by Jill Allan on 06/06/2023.
//

import Foundation
import SwiftData

@Model
class Trip {
//    @Attribute(.unique) var title: String
    var title: String
    var startDate: Date
    var endDate: Date
    var steps: [Step]? = []
    
    var tripSteps: [Step] {
        steps?.sorted() ?? []
    }
    
    
    // TODO: Add documentation
    
    init(title: String, startDate: Date, endDate: Date) {
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
    }
}
