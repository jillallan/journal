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
    var title: String
    var endDate: Date
 
    var steps: [Step]? = []
    
    // TODO: Add documentation
    
    init(title: String, startDate: Date, endDate: Date) {
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
    }
}
