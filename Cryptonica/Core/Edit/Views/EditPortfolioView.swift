//
//  EditPortfolioView.swift
//  Cryptonica
//
//  Created by Максим Боталов on 30.09.2023.
//

import SwiftUI

struct EditPortfolioView: View {
    
    // MARK: - Приватные свойства
    @State private var selectedCoin: CoinModel?
    
    // MARK: - Взаимодействие с UI
    @State private var quantityCoins: String = ""
    @State private var searchBarIsActive: Bool = false
    
    // MARK: - Объектые среды окружения
    @EnvironmentObject private var viewModel: HomeViewModel
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - Тело
    var body: some View {
        ZStack(alignment: .top, content: {
            Color.customTheme.primaryBackgroundColor.ignoresSafeArea(.all)
            
            VStack(alignment: .center, spacing: 0, content: {
                SearchBarView(searchBarIsActive: .constant(true), searchText: $viewModel.searchText)
                    .padding(.leading)
                
                ScrollView(.horizontal) {
                    HStack(alignment: .center, spacing: 16, content: {
                        ForEach(viewModel.searchText.isEmpty ? viewModel.portfolioCoins : viewModel.allCoins) { coin in
                            IconView(coin: coin)
                                .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        selectedCoin = coin
                                    }
                                }
                                .overlay(alignment: .topTrailing) {
                                    Image(systemName: "checkmark.circle.fill")
                                        .font(.headline26)
                                        .offset(x: 2.5)
                                        .foregroundStyle(selectedCoin?.id == coin.id ? Color.green : Color.clear)
                                }
                        }
                    })
                    .padding(.horizontal)
                }
                .scrollIndicators(.hidden)
                
                if selectedCoin != nil { coinEditingFields }
                
                Spacer(minLength: 16)
            })
        })
    }
}

// MARK: - Предварительный просмотр
struct EditPortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        EditPortfolioView()
            .environmentObject(HomeViewModel())
    }
}

// MARK: - UI-элементы
extension EditPortfolioView {
    private var coinEditingFields: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Current price:")
                Spacer()
                Text(selectedCoin?.currentPrice.asCurrencyDecimals() ?? "0.00 $")
            }
            
            Divider()
            
            HStack {
                Text("Your quantity:")
                Spacer()
                TextField("Ex.: 1.4", text: $quantityCoins)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.trailing)
            }
            
            Divider()
            
            HStack {
                Text("Current value:")
                Spacer()
                Text(getCurrentCoinAmount())
            }
            
            Button("SAVE") {
                guard selectedCoin != nil else { return }
                
                viewModel.updatePortfolio(for: selectedCoin!, amount: Double(quantityCoins)!)
                
                withAnimation(.easeInOut) {
                    searchBarIsActive = false
                    selectedCoin = nil
                    quantityCoins = ""
                    viewModel.searchText = ""
                    
                    dismiss()
                }
            }
        }
        .font(.semibold14)
        .padding()
    }
}

// MARK: - Дополнительные функции
extension EditPortfolioView {
    /// Умножает текущие кол-во монеты на текущую цену монеты
    /// ```
    /// 1234 -> "$1234"
    private func getCurrentCoinAmount() -> String {
        guard let quantity = Double(quantityCoins) else { return "0" }
        return (quantity * selectedCoin!.currentPrice).asCurrencyDecimals()
    }
}
