//
//  HomeScreenViewModel.swift
//  Cryptonica
//
//  Created by Максим Боталов on 27.09.2023.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCoins = [CoinModel]()
    @Published var portfolioCoins = [CoinModel]()
    @Published var searchText = ""
    
    @Published var isUpdating = false
    @Published var isSort = false
    
    @Published var statisticMarketData = [StatisticsModel]()
    
    @Published var typesSorting = TypesSorting.descendingRank
    
    private let coinsDataServices = CoinsDataServices()
    private let marketDataServices = MarketDataServices()
    private let portfolioContainerServices = PortfolioContainerServices()
    
    enum TypesSorting {
        case ascendingRank, descendingRank, ascendingHoldings, descendingHoldings, ascendingPrice, descendingPrice
    }
    
    private var anyCancellable = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        $searchText
            .combineLatest(coinsDataServices.$allCoins, $typesSorting)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filteringSearchTextAndSortCoins)
            .sink { [weak self] filteredCoins in
                self?.allCoins = filteredCoins
            }
            .store(in: &anyCancellable)
        
        marketDataServices.$marketData
            .combineLatest($portfolioCoins)
            .map { returnedMarketData, portfolioCoins -> [StatisticsModel] in
                var statistics = [StatisticsModel]()
                
                guard let data = returnedMarketData else { return statistics }
                
                let marketCup = StatisticsModel(title: "Market Cup",
                                               value: data.marketCap,
                                               percentageChange: data.marketCapChangePercentage24HUsd)
                let volume = StatisticsModel(title: "24H Volume",
                                            value: data.volume)
                let btcDominance = StatisticsModel(title: "BTC Dominance",
                                               value: data.btcDominance)
                let portfolioValue = StatisticsModel(title: "Portfolio", value: self.getAmountPortfolio(for: portfolioCoins).asCurrencyDecimals())
                
                statistics.append(contentsOf: [marketCup, volume, btcDominance, portfolioValue])
                return statistics
            }
            .sink { [weak self] returnedStatisticMarketData in
                self?.statisticMarketData = returnedStatisticMarketData
                self?.isUpdating = false
            }
            .store(in: &anyCancellable)
        
        $allCoins
            .combineLatest(portfolioContainerServices.$savedEntities)
            .map(mapEntitiesToCoinModels)
            .sink { [weak self] returnedCoins in
                guard let self = self else { return }
                self.portfolioCoins = self.sortingPortfolioCoins(for: returnedCoins)
            }
            .store(in: &anyCancellable)
    }
    
    func updatePortfolio(for coin: CoinModel, amount: Double) {
        portfolioContainerServices.updatePortfolio(for: coin, amount: amount)
    }
    
    func updateAllData() {
        isUpdating = true
        coinsDataServices.getCoinsFromNetwork()
        marketDataServices.getMarketDataFromNetwork()
        HapticTouchManager.notification(type: .success)
    }
    
    private func mapEntitiesToCoinModels(allCoins: [CoinModel], portfolioCoins: [PortfolioEntity]) -> [CoinModel] {
        allCoins.compactMap { coin in
            guard let entity = portfolioCoins.first(where: { $0.coinID == coin.id }) else { return nil }
            return coin.updateHoldings(amount: entity.amount)
        }
    }
    
    private func sortingPortfolioCoins(for coins: [CoinModel]) -> [CoinModel] {
        switch typesSorting {
        case .ascendingHoldings:
            return coins.sorted(by: { $0.currentHodlingsValue < $1.currentHodlingsValue })
        case .descendingHoldings:
            return coins.sorted(by: { $0.currentHodlingsValue > $1.currentHodlingsValue })
        default: return coins
        }
    }
    
    private func getAmountPortfolio(for portfolioCoins: [CoinModel]) -> Double {
        return portfolioCoins.map({ $0.currentHodlingsValue }).reduce(0, { $0 + $1 })
    }
    
    /// Sorting all coins by condition
    /// ```
    /// .ascendingRank -> 1, 2, 3, 4, ... 250
    /// .descendingRank -> 250, 249, ... 1
    /// ```
    private func sortingAllCoins(for coins: inout [CoinModel], by typesSorting: TypesSorting) {
        switch typesSorting {
            
        case .ascendingRank, .ascendingHoldings:
            coins.sort(by: { $0.rank < $1.rank })
        case .descendingRank, .descendingHoldings:
            coins.sort(by: { $0.rank > $1.rank })
        case .ascendingPrice:
            coins.sort(by: { $0.currentPrice < $1.currentPrice })
        case .descendingPrice:
            coins.sort(by: { $0.currentPrice > $1.currentPrice })
        }
    }
    
    private func sortingPortfolio() {}
    
    private func filteringSearchText(for coins: [CoinModel], by searchText: String) -> [CoinModel] {
        guard !searchText.isEmpty else { return coins }
        let lowercasedText = searchText.lowercased()
        let filteredCoins = coins.filter({
            return $0.name.lowercased().contains(lowercasedText) ||
            $0.symbol.lowercased().contains(lowercasedText) ||
            $0.id.lowercased().contains(lowercasedText)
        })
        return filteredCoins
    }
    
    private func filteringSearchTextAndSortCoins(searchText: String, coins: [CoinModel], typesSorting: TypesSorting) -> [CoinModel] {
        var filteredCoins = filteringSearchText(for: coins, by: searchText)
        sortingAllCoins(for: &filteredCoins, by: typesSorting)
        return filteredCoins
    }
}
