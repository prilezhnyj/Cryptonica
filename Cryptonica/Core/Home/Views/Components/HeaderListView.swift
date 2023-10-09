//
//  HeaderListView.swift
//  Cryptonica
//
//  Created by Максим Боталов on 27.09.2023.
//

import SwiftUI

struct HeaderListView: View {
    
    // MARK: - Входные параметры
    @Binding var selectedSegment: Int
    
    // MARK: - Объекты среды окружения
    @EnvironmentObject private var viewModel: HomeViewModel
    
    // MARK: - Тело
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            HeaderListButtonView(icon: "chevron.down", title: "Coin", action: {
                viewModel.typesSorting = viewModel.typesSorting == .ascendingRank ? .descendingRank : .ascendingRank
            })
            
            Spacer(minLength: 0)
            
            switch selectedSegment {
            case 0:
                HeaderListButtonView(icon: "chevron.down", title: "Price", action: {
                    viewModel.typesSorting = viewModel.typesSorting == .ascendingPrice ? .descendingPrice : .ascendingPrice
                })
                .frame(width: UIScreen.main.bounds.width / 3 - 10, alignment: .trailing)
            case 1:
                HeaderListButtonView(icon: "chevron.down", title: "Holdings", action: {
                    viewModel.typesSorting = viewModel.typesSorting == .ascendingHoldings ? .descendingHoldings : .ascendingHoldings
                })
                .frame(width: UIScreen.main.bounds.width / 3 - 10, alignment: .trailing)
                
                HeaderListButtonView(icon: "chevron.down", title: "Price", action: {
                    viewModel.typesSorting = viewModel.typesSorting == .ascendingPrice ? .descendingPrice : .ascendingPrice
                })
                .frame(width: UIScreen.main.bounds.width / 3 - 10, alignment: .trailing)
            default: EmptyView()
            }
        }
        .padding(.horizontal, 20)
        .background(Color.customTheme.primaryBackgroundColor)
    }
}

// MARK: - Предварительный просмотр
struct HeaderListView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderListView(selectedSegment: .constant(1))
            .environmentObject(HomeViewModel())
    }
}
