//
//  CoinImageView.swift
//  Cryptonica
//
//  Created by Максим Боталов on 27.09.2023.
//

import SwiftUI

struct CoinImageView: View {
    
    // MARK: - Объекты среды окружения
    @StateObject private var coinImageViewModel: CoinImageViewModel
    
    // MARK: - Инициализатор
    init(coin: CoinModel) {
        _coinImageViewModel = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }
    
    // MARK: - Тело
    var body: some View {
        ZStack(alignment: .center, content: {
            if let image = coinImageViewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else {
                ProgressView()
            }
        })
        .overlay(alignment: .center, content: {
            Circle()
                .stroke(lineWidth: 1)
                .foregroundColor(Color.customTheme.secondaryBackgroundColor)
        })
        .clipShape(Circle())
    }
}

// MARK: - Предварительный просмотр
struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoinImageView(coin: PreDev.instance.coin)
            .previewLayout(.sizeThatFits)
    }
}
