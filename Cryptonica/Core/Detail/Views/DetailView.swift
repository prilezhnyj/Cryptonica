//
//  DetailView.swift
//  Cryptonica
//
//  Created by Максим Боталов on 07.10.2023.
//

import SwiftUI

struct DetailView: View {
    
    // MARK: - Объекты среды окружения
    @StateObject private var viewModel: DetailViewModel
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.dismiss) private var dismiss
    
    //MARK: - Приватные свойства
    private let gridColumns = [
        GridItem(.flexible(), spacing: 16, alignment: .leading),
        GridItem(.flexible(), spacing: 16, alignment: .leading)
    ]
    
    @State private var lineLimitDescription = 3
    
    // MARK: - Инициализатор
    init(coin: CoinModel) {
        _viewModel = StateObject(wrappedValue: DetailViewModel(for: coin))
    }
    
    // MARK: - Тело
    var body: some View {
        ZStack(alignment: .top) {
            Color.customTheme.primaryBackgroundColor.ignoresSafeArea(.all)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 0, content: {
                    InfoTopBarView(coin: viewModel.coin)
                        .padding()
                    
                    CoinChartChange7D(coin: viewModel.coin)
                    
                    LazyVGrid(columns: gridColumns,
                              alignment: .leading,
                              spacing: 16, pinnedViews: []) {
                        ForEach(viewModel.overviewStatistics) { item in
                            StatisticsColumnView(statistics: item)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical)
                                .background(Color.customTheme.primaryBackgroundColor)
                                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                                .shadow(color: colorScheme == .light ? Color.customTheme.secondaryBackgroundColor : Color.customTheme.secondaryBackgroundColor.opacity(0.5), radius: 10, x: 0, y: 0)
                            
                        }
                    }.padding()
                    
                    LazyVGrid(columns: gridColumns,
                              alignment: .leading,
                              spacing: 16, pinnedViews: []) {
                        ForEach(viewModel.additionalStatistics) { item in
                            StatisticsColumnView(statistics: item)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical)
                                .background(Color.customTheme.primaryBackgroundColor)
                                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                                .shadow(color: colorScheme == .light ? Color.customTheme.secondaryBackgroundColor : Color.customTheme.secondaryBackgroundColor.opacity(0.5), radius: 10, x: 0, y: 0)
                            
                        }
                    }.padding(.horizontal)
                    
                    // Description
                    description(for: viewModel.description.removingHTML)
                    
                    LazyHStack(alignment: .center, spacing: 8, pinnedViews: []) {
                        HStack(alignment: .center, spacing: 8) {
                            LinkButtonView(icon: "LogoBrowser", title: "Homepage", action: {})
                            LinkButtonView(icon: "LogoReddit", title: "Reddit", action: {})
                            LinkButtonView(icon: "LogoGit", title: "GitHub", action: {})
                        }
                    }
                    .padding()
                })
            }
        }
    }
}

// MARK: - Предварительный просмотр
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(coin: PreDev.instance.coin)
    }
}

extension DetailView {
    private func description(for description: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("🔖 Description")
                .font(.headline16)
                .foregroundColor(Color.customTheme.primaryTextColor)
            
            Text(description)
                .font(.regular14)
                .foregroundColor(lineLimitDescription <= 3 ? Color.customTheme.secondaryTextColor : Color.customTheme.primaryTextColor)
                .lineLimit(lineLimitDescription)
            
            Button(lineLimitDescription <= 3 ? "Read more" : "Read less") {
                withAnimation(.easeInOut) {
                    lineLimitDescription = lineLimitDescription <= 3 ? 1000 : 3
                }
            }
            .font(.system(size: 14, weight: .bold, design: .rounded))
        }
        .padding(.top)
        .padding(.horizontal)
    }
}
