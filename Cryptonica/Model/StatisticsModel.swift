//
//  StatisticModel.swift
//  Cryptonica
//
//  Created by Максим Боталов on 28.09.2023.
//

import Foundation

// MARK: - МОДЕЛЬ СТАТИСТИКИ НА ГЛАВНОМ ЭКРАНЕ
struct StatisticsModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
    init(title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
}
