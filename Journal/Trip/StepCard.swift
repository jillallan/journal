//
//  StepCard.swift
//  Journal
//
//  Created by Jill Allan on 18/06/2023.
//

import SwiftUI

struct StepCard: View {
    let title: String
    
    var body: some View {
        
        Image(.bedminster)
            .resizable()
            .scaledToFill()
//            .scaledToFit()
//            .aspectRatio(1, contentMode: .fill)
//            .aspectRatio(16.0 / 9.0, contentMode: .fit)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .clipped(antialiased: true)
            .aspectRatio(1, contentMode: .fit)
            .cornerRadius(25)
            .overlay {
                VStack {
                    HStack {
                        Text(title)
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
    StepCard(title: "test")
}
