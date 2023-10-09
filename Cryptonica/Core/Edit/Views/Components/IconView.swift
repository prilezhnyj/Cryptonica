//
//  IconView.swift
//  Cryptonica
//
//  Created by Максим Боталов on 29.09.2023.
//

import SwiftUI

struct IconView: View {
    
    // MARK: - Входные параметры
    let coin: CoinModel
    
    // MARK: - Тело
    var body: some View {
        VStack(alignment: .center, spacing: 4, content: {
            CoinImageView(coin: coin)
                .frame(width: 36, height: 36, alignment: .center)
            
            Text(coin.symbol.uppercased())
                .font(.semibold14)
                .foregroundColor(Color.customTheme.primaryTextColor)
                .lineLimit(1)
            
            Text(coin.name)
                .font(.regular14)
                .foregroundColor(Color.customTheme.secondaryTextColor)
                .lineLimit(1)
            
            if coin.currentHoldings != nil {
                Text(coin.currentHodlingsValue.asCurrencyDecimals())
                    .font(.regular14)
                    .foregroundColor(Color.customTheme.secondaryTextColor)
                    .lineLimit(1)
            }
        })
        .frame(width: 70, alignment: .center)
        .padding(.vertical, 8)
    }
}

// MARK: - Предварительный просмотр
struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        IconView(coin: PreDev.instance.coin)
            .previewLayout(.sizeThatFits)
    }
}
