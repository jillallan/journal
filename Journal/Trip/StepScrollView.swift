//
//  StepScrollView.swift
//  Journal
//
//  Created by Jill Allan on 15/06/2023.
//

import OSLog
import SwiftData
import SwiftUI

struct StepScrollView: View {
    
    private let logger = Logger(
        subsystem: Bundle.main.bundleIdentifier!,
        category: String(describing: StepScrollView.self)
    )
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.mainWindowSize) private var windowSize
    @Environment(\.windowSize) private var windowSize2
    

    @Binding var scrolledID: Step.ID?
//    @Binding var mainID: PersistentIdentifier?
    let steps: [Step]
    
    private var windowAspectRatio: Double {
        let aspectRatio = windowSize2.width / windowSize2.height
//        logger.debug("window width: \(windowSize2.width)")
//        logger.debug("window height: \(windowSize2.height)")
//        logger.debug("window aspect ratio: \(aspectRatio)")
        return aspectRatio
    }
    
    private var scrollItemCount: Int {
        let itemCount = windowAspectRatio >= 1 ? 2 : 1
//        logger.debug("item count: \(itemCount)")
        return itemCount
    }
    
    private var scrollHeight: Double {

        let aspectRatio = Double(scrollItemCount) * 1 // 16.0 / 9.0
//        logger.debug("aspect ratio: \(aspectRatio)")
        
        let height = windowSize2.width / aspectRatio
        
        logger.debug("height: \(height)")
        return height
    }
    
    var body: some View {
        
        let _ = logger.debug("scrolledID: \(String(describing: scrolledID))")
        
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10) {
                TripOverviewCard()
                    .containerRelativeFrame(.horizontal, count: scrollItemCount, spacing: 10.0)
                ForEach(steps) { step in
                    StepCard(title: step.stepTitle)
                        .containerRelativeFrame(.horizontal, count: scrollItemCount, spacing: 10.0)
                }
                StepCard(title: "Hello")
                    .containerRelativeFrame(.horizontal, count: scrollItemCount, spacing: 10.0)
            }
            .scrollTargetLayout()
        }
        .frame(height: scrollHeight)
        .safeAreaPadding(.horizontal, 20)
        .scrollTargetBehavior(.viewAligned)
        .scrollIndicators(.hidden)
        .scrollPosition(id: $scrolledID)
    }
}

struct StepScrollView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            StepScrollView(scrolledID: Binding.constant(Step.preview.id), steps: Step.previews)
                .modelContainer(previewContainer)
        }
    }
}
