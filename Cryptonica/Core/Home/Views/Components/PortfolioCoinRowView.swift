//
//  PortfolioCoinRowView.swift
//  Cryptonica
//
//  Created by Максим Боталов on 02.10.2023.
//

import SwiftUI

struct PortfolioCoinRowView: View {
    
    // MARK: - Входные параметры
    var coin: CoinModel
    
    // MARK: - Тело
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            CoinImageView(coin: coin)
                .padding(.trailing)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(coin.symbol.uppercased())
                    .font(.headline16)
                    .foregroundColor(Color.customTheme.primaryTextColor)
                    .lineLimit(1)
                
                Text(coin.name)
                    .font(.regular14)
                    .foregroundColor(Color.customTheme.secondaryTextColor)
                    .lineLimit(1)
            }
            
            Spacer(minLength: 0)
            
            VStack(alignment: .trailing, spacing: 0) {
                Text(coin.currentHodlingsValue.asCurrencyDecimals())
                    .font(.headline16)
                    .foregroundColor(Color.customTheme.primaryTextColor)
                    .lineLimit(1)
                
                Text((coin.currentHoldings ?? 0).asNumberString())
                .font(.regular14)
                .foregroundColor(Color.customTheme.secondaryTextColor)
            }
            .frame(width: UIScreen.main.bounds.width / 3 - 10, alignment: .trailing)
            
            VStack(alignment: .trailing, spacing: 0) {
                Text(coin.currentPrice.asCurrencyDecimals())
                    .font(.headline16)
                    .foregroundColor(Color.customTheme.primaryTextColor)
                    .lineLimit(1)
                
                HStack(alignment: .center, spacing: 2) {
                    Image(systemName: "arrow.up.forward.app.fill")
                        .rotationEffect(.degrees((coin.priceChangePercentage24H ?? 0) >= 0 ? 0 : -180))
                    
                    Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                }
                .font(.regular14)
                .foregroundColor((coin.priceChangePercentage24H ?? 0) >= 0 ? .green : .red)
            }
            .frame(width: UIScreen.main.bounds.width / 3 - 10, alignment: .trailing)
        }
        .frame(height: 36)
        .background(Color.customTheme.primaryBackgroundColor)
    }
}

// MARK: - Предварительный просмотр
struct PortfolioCoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioCoinRowView(coin: PreDev.instance.coin)
            .previewLayout(.sizeThatFits)
    }
}
