//
//  CoinModel.swift
//  Cryptonica
//
//  Created by Максим Боталов on 27.09.2023.
//

import Foundation

// MARK: - МОДЕЛЬ МОНЕТЫ
struct CoinModel: Identifiable, Codable {
    var id, symbol, name: String
    var image: String?
    var currentPrice: Double
    var marketCap, marketCapRank, fullyDilutedValuation, totalVolume: Double?
    var high24H, low24H: Double?
    var priceChange24H, priceChangePercentage24H, marketCapChange24H, marketCapChangePercentage24H: Double?
    var circulatingSupply, totalSupply, maxSupply, ath: Double?
    var athChangePercentage: Double?
    var athDate: String?
    var atl, atlChangePercentage: Double?
    var atlDate: String?
    var lastUpdated: String?
    var sparklineIn7D: SparklineIn7D?
    var priceChangePercentage24HInCurrency: Double?
    var currentHoldings: Double?

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case currentHoldings
    }
    
    func updateHoldings(amount: Double) -> CoinModel {
        return CoinModel(id: id,
                         symbol: symbol,
                         name: name,
                         image: image,
                         currentPrice: currentPrice,
                         marketCap: marketCap,
                         marketCapRank: marketCapRank,
                         fullyDilutedValuation: fullyDilutedValuation,
                         totalVolume: totalVolume,
                         high24H: high24H,
                         low24H: low24H,
                         priceChange24H: priceChange24H,
                         priceChangePercentage24H: priceChangePercentage24H,
                         marketCapChange24H: marketCapChange24H,
                         marketCapChangePercentage24H: marketCapChangePercentage24H,
                         circulatingSupply: circulatingSupply,
                         totalSupply: totalSupply,
                         maxSupply: maxSupply,
                         ath: ath,
                         athChangePercentage: athChangePercentage,
                         athDate: athDate,
                         atl: atl,
                         atlChangePercentage: atlChangePercentage,
                         atlDate: atlDate,
                         lastUpdated: lastUpdated,
                         sparklineIn7D: sparklineIn7D,
                         priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency,
                         currentHoldings: amount)
    }
    
    var currentHodlingsValue: Double {
        return currentPrice * (currentHoldings ?? 0)
    }
    
    var rank: Int {
        return Int(marketCapRank ?? 0)
    }
}

// MARK: - SPARKLINEIN7D
struct SparklineIn7D: Codable {
    let price: [Double]?
}

