//
//  CoinsListView.swift
//  Cryptonica
//
//  Created by Максим Боталов on 27.09.2023.
//

import SwiftUI

struct CoinsListView: View {
    
    // MARK: - Входные параметры
    var allCoins: [CoinModel]
    var portfolioCoins: [CoinModel]
    @Binding var selectedSegment: Int
    @Binding var selectedCoin: CoinModel?
    @Binding var showDetailScreenView: Bool
    
    // MARK: - Тело
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            HeaderListView(selectedSegment: $selectedSegment)
            
            switch selectedSegment {
            case 0:
                List {
                    ForEach(allCoins) { coin in
                        AllCoinRowView(coin: coin)
                            .onTapGesture {
                                segue(for: coin)
                            }
                    }
                }
                .scrollIndicators(.hidden)
                .listStyle(.plain)
            case 1:
                List {
                    ForEach(portfolioCoins) { coin in
                        PortfolioCoinRowView(coin: coin)
                            .onTapGesture {
                                segue(for: coin)
                            }
                    }
                }
                .scrollIndicators(.hidden)
                .listStyle(.plain)
            default:
                EmptyView()
            }
        }
    }
}

// MARK: - Предварительный просмотр
struct CoinsListView_Previews: PreviewProvider {
    static var previews: some View {
        CoinsListView(allCoins: PreDev.instance.coins, portfolioCoins: PreDev.instance.coins, selectedSegment: .constant(1), selectedCoin: .constant(PreDev.instance.coin), showDetailScreenView: .constant(false))
            .previewLayout(.sizeThatFits)
    }
}

// MARK: - Дополнительные функции
extension CoinsListView {

    /// Переход к нужной монете на главной экране. Вызывается в .onTapGesture
    private func segue(for coin: CoinModel) {
        selectedCoin = coin
        withAnimation(.easeInOut) {
            showDetailScreenView.toggle()
        }
    }
}
