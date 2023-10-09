//
//  CoinImageServices.swift
//  Cryptonica
//
//  Created by Максим Боталов on 27.09.2023.
//

import Foundation
import Combine
import SwiftUI

class CoinImageServices: ObservableObject {
    @Published var image: UIImage? = nil
    
    private let coin: CoinModel
    private var imageCancellable: AnyCancellable?
    private let localFileManager = LocalFileManager.instance
    private let folderName = "coins_images"
    private let imageName: String
    
    
    init(for coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        getImageCoinFromFileManager()
    }
    
    private func getImageCoinFromFileManager() {
        if let savedImage = localFileManager.loadImage(imageName: imageName, folderName: folderName) {
            image = savedImage
        } else {
            downloadImageCoinFromNetwork()
        }
    }
    
    private func downloadImageCoinFromNetwork() {
        let url = URL(string: coin.image!)
        
        imageCancellable = NetworkManager.download(for: url!)
            .tryMap({ data -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkManager.handleCompletion,
                  receiveValue: { [weak self] returnedImage in
                guard let self = self,
                      let downloadedImage = returnedImage else { return }
                self.image = returnedImage
                self.imageCancellable?.cancel()
                self.localFileManager.saveImage(for: downloadedImage, imageName: imageName, folderName: folderName)
            })
    }
}
