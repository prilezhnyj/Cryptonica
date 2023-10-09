//
//  DetailViewModel.swift
//  Cryptonica
//
//  Created by Максим Боталов on 08.10.2023.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    @Published var overviewStatistics = [StatisticsModel]()
    @Published var additionalStatistics = [StatisticsModel]()
    @Published var description: String = ""
    
    @Published var coin: CoinModel
    private let detailCoinDataServices: DetailCoinDataServices
    private var anyCancellable = Set<AnyCancellable>()
    
    init(for coin: CoinModel) {
        self.coin = coin
        detailCoinDataServices = DetailCoinDataServices(for: coin)
        addSubscribers()
        
        print("Init viewmodel \(coin.id)")
    }
    
    deinit {
        anyCancellable.removeAll()
        print("DEINIT VIEWMODEL DETAIL")
    }
    
    private func addSubscribers() {
        detailCoinDataServices.$detailCoin
            .combineLatest($coin, $description)
            .map(mapDetailCoinModelToStatisticsModel)
            .sink { [weak self] returnedArrays in
                guard let self = self else { return }
                self.overviewStatistics = returnedArrays.overviewStatistics
                self.additionalStatistics = returnedArrays.additionalStatistics
                self.description = returnedArrays.description
            }
            .store(in: &anyCancellable)
        
        
    }
    
    private func mapDetailCoinModelToStatisticsModel(detailCoin: DetailCoinModel?, coinModel: CoinModel, description: String) -> (overviewStatistics: [StatisticsModel], additionalStatistics: [StatisticsModel], description: String) {
        
        
        let overviewStatistics = overviewStatistics(coinModel: coinModel)
        let additionalStatistics = additionalStatistics(detailCoin: detailCoin, coinModel: coinModel)
        
        let descriptionCoin = detailCoin?.description?.en
        
        return (overviewStatistics, additionalStatistics, descriptionCoin ?? "No descriptionCoin")
    }
    
    /// The function returns an array [StatisticsModel]
    /// ```
    /// return [price, marketCup, rank, volume]
    private func overviewStatistics(coinModel: CoinModel) -> [StatisticsModel] {
        let price = coinModel.currentPrice.asCurrencyDecimals()
        let priceChage = coinModel.priceChangePercentage24H
        let priceStatistics = StatisticsModel(title: "Current Price", value: price, percentageChange: priceChage)
        
        let marketCup = coinModel.marketCap?.formattedWithAbbreviations()
        let marketCupChange = coinModel.marketCapChange24H
        let marketCupStatistics = StatisticsModel(title: "Market Cup", value: marketCup ?? "", percentageChange: marketCupChange)
        
        let rank = "\(coinModel.rank)"
        let rankStatistics = StatisticsModel(title: "Rank", value: rank)
        
        let volume = coinModel.totalVolume?.formattedWithAbbreviations()
        let volumeStatistics = StatisticsModel(title: "Volume", value: volume ?? "")
        
        return [priceStatistics, marketCupStatistics, rankStatistics, volumeStatistics]
    }
    
    /// The function returns an array [StatisticsModel]
    /// ```
    /// return [price, marketCup, rank, volume]
    private func additionalStatistics(detailCoin: DetailCoinModel?,coinModel: CoinModel) -> [StatisticsModel] {
        let hight24H = coinModel.high24H?.asCurrencyDecimals()
        let hight24HStatistics = StatisticsModel(title: "Hight 24H", value: hight24H ?? "$0.00")
        
        let low24H = coinModel.low24H?.asCurrencyDecimals()
        let low24HStatistics = StatisticsModel(title: "Hight 24H", value: low24H ?? "$0.00")
        
        let priceChange = coinModel.priceChange24H?.asCurrencyDecimals() ?? "n/a"
        let pricePercentageChange = coinModel.priceChangePercentage24H
        let priceChangeStatistics = StatisticsModel(title: "Change 24H", value: priceChange, percentageChange: pricePercentageChange)
        
        let marketCapChange = coinModel.marketCapChange24H?.formattedWithAbbreviations() ?? "n/a"
        let marketCapPercentageChange = coinModel.marketCapChangePercentage24H
        let marketCapChangeStatistics = StatisticsModel(title: "Market 24H", value: marketCapChange, percentageChange: marketCapPercentageChange)
        
        return [hight24HStatistics, low24HStatistics, priceChangeStatistics, marketCapChangeStatistics]
    }
}


