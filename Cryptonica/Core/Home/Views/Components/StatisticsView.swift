//
//  StatisticsView.swift
//  Cryptonica
//
//  Created by Максим Боталов on 28.09.2023.
//

import SwiftUI

struct StatisticsView: View {
    
    // MARK: - Входные параметры
    var statistics: [StatisticsModel]
    @Binding var selectedSegment: Int
    
    // MARK: - Тело
    var body: some View {
        HStack(alignment: .top, spacing: 0, content: {
            ForEach(statistics) {
                StatisticsColumnView(statistics: $0)
                    .frame(width: UIScreen.main.bounds.width / 3, alignment: .leading)
            }
        })
        .frame(width: UIScreen.main.bounds.width, alignment: selectedSegment != 1 ? .leading : .trailing)
        .padding(.top)
    }
}

// MARK: - Предварительный просмотр
struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView(statistics: PreDev.instance.statistics, selectedSegment: .constant(0))
            .previewLayout(.sizeThatFits)
    }
}
