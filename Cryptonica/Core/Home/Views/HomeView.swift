//
//  HomeView.swift
//  Cryptonica
//
//  Created by Максим Боталов on 27.09.2023.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Приватные свойства
    @State private var headlineText = "Live prices"
    @State private var subheadlineText = "Real-time traces"
    @State private var selectedCoin: CoinModel?
    
    // MARK: - Взаимодействие с UI
    @State private var selectedSegment = 0
    @State private var searchBarIsActive = false
    @State private var showPortfolioEditingScreen = false
    @State private var showDetailScreenView = false
    @State private var showSettingsView = false
    
    // MARK: - Объекты среды окружения
    @EnvironmentObject private var viewModel: HomeViewModel
    
    // MARK: - Тело
    var body: some View {
        ZStack(alignment: .top, content: {
            Color.customTheme.primaryBackgroundColor.ignoresSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 0, content: {
                TopBarView(headline: $headlineText, subheadline: $subheadlineText, searchText: $viewModel.searchText, searchBarIsActive: $searchBarIsActive, showSettingsView: $showSettingsView)
                
                if !searchBarIsActive {
                    StatisticsView(statistics: viewModel.statisticMarketData, selectedSegment: $selectedSegment)
                }
                
                SegmentedControlView(headline: $headlineText, subheadline: $subheadlineText, selectedSegment: $selectedSegment, showPortfolioEditingScreen: $showPortfolioEditingScreen)
                
                if selectedSegment == 0 || selectedSegment == 1 {
                    CoinsListView(allCoins: viewModel.allCoins, portfolioCoins: viewModel.portfolioCoins, selectedSegment: $selectedSegment, selectedCoin: $selectedCoin, showDetailScreenView: $showDetailScreenView)
                        .environmentObject(viewModel)
                }
            })
        })
        .sheet(isPresented: $showPortfolioEditingScreen) {
            EditPortfolioView()
                .environmentObject(viewModel)
        }
        .sheet(isPresented: $showDetailScreenView) {
            DetailView(coin: selectedCoin ?? PreDev.instance.coin)
        }
    }
}

// MARK: - Предварительный просмотр
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(PreDev.instance.homeScreenViewModel)
    }
}
