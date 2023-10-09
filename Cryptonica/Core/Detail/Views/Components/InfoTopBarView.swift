//
//  InfoTopBarView.swift
//  Cryptonica
//
//  Created by Максим Боталов on 07.10.2023.
//

import SwiftUI

struct InfoTopBarView: View {
    
    // MARK: - Входные параметры
    var coin: CoinModel
    
    // MARK: - Объекты среды окружения
    @Environment(\.colorScheme) private var colorScheme
    
    // MARK: - Тело
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            CoinImageView(coin: coin)
                .frame(width: 48, height: 48, alignment: .center)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(coin.name.capitalized)
                    .font(.headline26)
                    .foregroundColor(Color.customTheme.primaryTextColor)
                
                Text(coin.symbol.uppercased())
                    .font(.regular14)
                    .foregroundColor(Color.customTheme.secondaryTextColor)
            }
            
            Spacer()
        }
        .padding()
        .background(Color.customTheme.primaryBackgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: colorScheme == .light ? Color.customTheme.secondaryBackgroundColor : Color.customTheme.secondaryBackgroundColor.opacity(0.5), radius: 10, x: 0, y: 0)
    }
}

// MARK: - Предварительный просмотр
struct InfoTopBarView_Previews: PreviewProvider {
    static var previews: some View {
        InfoTopBarView(coin: PreDev.instance.coin)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
