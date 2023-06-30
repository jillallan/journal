//
//  TripOverviewCard.swift
//  Journal
//
//  Created by Jill Allan on 29/06/2023.
//

import SwiftUI

struct TripOverviewCard: View {

    
    var body: some View {
        Image(.bedminster)
            .resizable()
            .aspectRatio(1, contentMode: .fit)
//            .aspectRatio(16.0 / 9.0, contentMode: .fit)
            .clipped(antialiased: true)
            .cornerRadius(25)
            .overlay {
                VStack {
                    HStack {
                        Text("Overview")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                        Spacer()
                    }
                    Spacer()
                }
                .padding()
            }
    }
}

#Preview {
    TripOverviewCard()
}
