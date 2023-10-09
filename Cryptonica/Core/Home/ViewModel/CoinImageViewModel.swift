//
//  CoinImageViewModel.swift
//  Cryptonica
//
//  Created by Максим Боталов on 27.09.2023.
//

import Foundation
import Combine
import SwiftUI

class CoinImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoad = false
    
    private var coin: CoinModel
    private var coinImageServices: CoinImageServices
    private var anyCancellable = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coin = coin
        coinImageServices = CoinImageServices(for: coin)
        isLoad = true
        getImage()
    }
    
    private func getImage() {
        coinImageServices.$image
            .sink { [weak self] _ in
                self?.isLoad = false
            } receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
            }
            .store(in: &anyCancellable)

    }
}
