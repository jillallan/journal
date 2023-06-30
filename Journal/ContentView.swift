//
//  ContentView.swift
//  Journal
//
//  Created by Jill Allan on 08/06/2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    
    var body: some View {
        TabView {
            TripsView()
                .tabItem {
                    Label("Trips", systemImage: "suitcase")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .modelContainer(previewContainer)
    }
}
//
//#Preview {
//    ContentView()
//        .modelContainer(previewContainer)
//}
