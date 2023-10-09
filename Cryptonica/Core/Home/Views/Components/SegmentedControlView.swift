//
//  SegmentedControlView.swift
//  Cryptonica
//
//  Created by Максим Боталов on 27.09.2023.
//

import SwiftUI

struct SegmentedControlView: View {
    
    // MARK: - Входные параметры
    @Binding var headline: String
    @Binding var subheadline: String
    @Binding var selectedSegment: Int
    @Binding var showPortfolioEditingScreen: Bool
    
    // MARK: - Приватные свойства
    private enum Section: String, CaseIterable {
        case livePrices = "😮 Live"
        case portfolio = "🧳 Portfolio"
        case editPortfolio = "📝 Edit Portfolio"
        case settings = "⚙️ Settings"
    }
    
    // MARK: - Тело
    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .center, spacing: 8) {
                SegmentButtonView(title: Section.livePrices.rawValue, isActive: selectedSegment == 0 ? true : false) {
                    withAnimation(.easeInOut) {
                        headline = "Live prices"
                        subheadline = "Real-time traces"
                        selectedSegment = 0
                    }
                }
                
                SegmentButtonView(title: Section.portfolio.rawValue, isActive: selectedSegment == 1 ? true : false) {
                    withAnimation(.easeInOut) {
                        headline = "Your portfolio"
                        subheadline = "All your supplies are here"
                        selectedSegment = 1
                    }
                }
                
                if selectedSegment == 1 {
                    SegmentButtonView(title: Section.editPortfolio.rawValue, isActive: selectedSegment == 1 ? true : false) {
                        withAnimation(.easeInOut) {
                            showPortfolioEditingScreen = true
                        }
                    }
                }
                
                SegmentButtonView(title: Section.settings.rawValue, isActive: selectedSegment == 3 ? true : false) {
                    withAnimation(.easeInOut) {
                        headline = "Settings"
                        subheadline = "Do it all for yourself"
                        selectedSegment = 3
                    }
                }
            }
            .padding()
        }
        .scrollIndicators(.hidden)
    }
}

// MARK: - Предварительный просмотр
struct SegmentedControlView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControlView(headline: .constant("Headline"), subheadline: .constant("Subheadline"), selectedSegment: .constant(0), showPortfolioEditingScreen: .constant(false))
            .previewLayout(.sizeThatFits)
    }
}
