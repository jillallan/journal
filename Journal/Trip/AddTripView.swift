//
//  AddTripView.swift
//  Journal
//
//  Created by Jill Allan on 08/06/2023.
//

import SwiftUI

struct AddTripView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State var title: String = ""
    @State var startDate: Date = Date.now
    @State var endDate: Date = Date.now
    
    var body: some View {
        Form {
            TextField("Trip Title", text: $title)
            DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
            DatePicker("End Date", selection: $endDate, displayedComponents: .date)
            
            Button {
                addTrip()
                dismiss()
            } label: {
                Text("Add Trip")
            }
        }
    }
    
    func addTrip() {
        let newTrip = Trip(title: title, startDate: startDate, endDate: endDate)
        modelContext.insert(newTrip)
    }
}

#Preview {
    AddTripView()
}
