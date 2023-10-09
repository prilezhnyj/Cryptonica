//
//  MarketDataServices.swift
//  Cryptonica
//
//  Created by Максим Боталов on 29.09.2023.
//

import Foundation
import Combine

class MarketDataServices {
    @Published var marketData: MarketDataModel? = nil
    
    private var marketDataCancellable: AnyCancellable?
    
    init() {
        getMarketDataFromNetwork()
    }
    
    func getMarketDataFromNetwork() {
        let url = URL(string: "https://api.coingecko.com/api/v3/global")
        
        marketDataCancellable = NetworkManager.download(for: url!)
            .decode(type: GlobalDataModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion,
                  receiveValue: { [weak self] returnedGlobalData in
                self?.marketData = returnedGlobalData.data
                self?.marketDataCancellable?.cancel()
            })
    }
}
