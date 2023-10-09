//
//  CoinChartChange7D.swift
//  Cryptonica
//
//  Created by Максим Боталов on 09.10.2023.
//

import SwiftUI
import Charts

struct CoinChartChange7D: View {
    
    let data: [Double]
    
    private let maxY: Double
    private let minY: Double
    private let colorLine: Color
    
    @State private var percentage = CGFloat(0)
    
    init(coin: CoinModel) {
        self.data = coin.sparklineIn7D?.price ?? []
        
        maxY = data.max() ?? 0
        minY = data.min() ?? 0
        
        let priceChage = (data.last ?? 0) - (data.first ?? 0)
        colorLine = priceChage > 0 ? .green : .red
    }
    
    var body: some View {
        chartLine
            .padding(.vertical, 20)
            .frame(height: 200, alignment: .center)
            .overlay(alignment: .leading) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Max: " + maxY.asCurrencyDecimals())
                        .padding(.horizontal, 32)
                    Spacer()
                    Text("Min: " + minY.asCurrencyDecimals())
                        .padding(.horizontal, 32)
                }
                .font(.regular14)
                .foregroundColor(Color.customTheme.secondaryTextColor)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation(.easeInOut(duration: 3)) {
                            percentage = 1
                        }
                    }
                }
            }
    }
}

struct CoinChartChange7D_Previews: PreviewProvider {
    static var previews: some View {
        CoinChartChange7D(coin: PreDev.instance.coin)
            .previewLayout(.sizeThatFits)
    }
}

extension CoinChartChange7D {
    private var chartLine: some View {
        GeometryReader { geometry in
            Path { path in
                for index in data.indices {
                    let xP = geometry.size.width / CGFloat(data.count) * CGFloat(index + 1)
                    
                    let yAxis = maxY - minY
                    
                    let yP = (1 - CGFloat((data[index] - minY) / yAxis)) * geometry.size.height
                    
                    if index == 0 {
                        path.move(to: .init(x: xP, y: yP))
                    }
                    
                    path.addLine(to: .init(x: xP, y: yP))
                }
            }
            .trim(from: 0, to: percentage)
            .stroke(colorLine, style: .init(lineWidth: 2, lineCap: .round, lineJoin: .round))
            .shadow(color: colorLine, radius: 10, x: 0, y: 10)
            .shadow(color: colorLine.opacity(0.5), radius: 10, x: 0, y: 20)
            .shadow(color: colorLine.opacity(0.25), radius: 10, x: 0, y: 30)
            .shadow(color: colorLine.opacity(0.1), radius: 10, x: 0, y: 40)
        }
    }
}
