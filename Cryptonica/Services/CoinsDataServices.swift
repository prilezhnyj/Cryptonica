//
//  CoinsDataServices.swift
//  Cryptonica
//
//  Created by Максим Боталов on 27.09.2023.
//

import Foundation
import Combine

class CoinsDataServices {
    @Published var allCoins = [CoinModel]()
    
    private var coinsCancellable: AnyCancellable?
    
    init() {
        getCoinsFromNetwork()
    }
    
    func getCoinsFromNetwork() {
        let url = URL(string:
                        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h&locale=en&precision=full")
        
        coinsCancellable = NetworkManager.download(for: url!)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion,
                  receiveValue: { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
                self?.coinsCancellable?.cancel()
            })
    }
}
