//
//  DetailCoinDataServices.swift
//  Cryptonica
//
//  Created by Максим Боталов on 08.10.2023.
//

import Foundation
import Combine

class DetailCoinDataServices {
    @Published var detailCoin: DetailCoinModel?
    
    private var detailCoinCancellable: AnyCancellable?
    
    private var coin: CoinModel
    
    init(for coin: CoinModel) {
        self.coin = coin
        getDetailCoinFromNetwork()
    }
    
    private func getDetailCoinFromNetwork() {
        let url = URL(string:
                        "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false")
        
        detailCoinCancellable = NetworkManager.download(for: url!)
            .decode(type: DetailCoinModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion,
                  receiveValue: { [weak self] returnedDetailCoin in
                self?.detailCoin = returnedDetailCoin
                self?.detailCoinCancellable?.cancel()
            })
    }
}
