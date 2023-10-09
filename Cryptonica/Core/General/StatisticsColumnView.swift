//
//  StatisticsColumnView.swift
//  Cryptonica
//
//  Created by Максим Боталов on 28.09.2023.
//

import SwiftUI

struct StatisticsColumnView: View {
    
    // MARK: - Публичные свойства
    let statistics: StatisticsModel
    
    // MARK: - Тело
    var body: some View {
        VStack(alignment: .leading, spacing: 2, content: {
            Text(statistics.title)
                .font(.regular14)
                .foregroundColor(Color.customTheme.secondaryTextColor)
                .lineLimit(1)
            Text(statistics.value)
                .font(.headline16)
                .foregroundColor(Color.customTheme.primaryTextColor)
                .lineLimit(1)
            
            if statistics.percentageChange != nil {
                HStack(alignment: .center, spacing: 2) {
                    Image(systemName: "arrow.up.forward.app.fill")
                        .rotationEffect(.degrees((statistics.percentageChange ?? 0) >= 0 ? 0 : -180))
                    
                    Text(statistics.percentageChange?.asPercentString() ?? "")
                }
                .font(.semibold14)
                .foregroundColor((statistics.percentageChange ?? 0) >= 0 ? .green : .red)
                .lineLimit(1)
                .opacity(statistics.percentageChange == nil ? 0 : 1)
            }
        })
        .padding(.horizontal)
        .background(Color.customTheme.primaryBackgroundColor)
    }
}

// MARK: - Предварительный просмотр
struct StatisticsColumnView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsColumnView(statistics: PreDev.instance.statisticData)
            .previewLayout(.sizeThatFits)
    }
}
