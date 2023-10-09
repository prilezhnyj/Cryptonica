//
//  HeaderListButtonView.swift
//  Cryptonica
//
//  Created by Максим Боталов on 05.10.2023.
//

import SwiftUI


struct HeaderListButtonView: View {
    
    // MARK: - Входные параметры
    var icon: String
    var title: String
    var action: () -> Void
    
    // MARK: - Взаимодействие с UI
    @State private var tapGesture = false
    
    // MARK: - Тело
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Image(systemName: icon)
                .rotationEffect(.degrees(tapGesture == false ? 0 : 180), anchor: .center)
            Text(title)
        }
        .font(.semibold14)
        .foregroundColor(Color.customTheme.secondaryTextColor)
        .background(Color.customTheme.primaryBackgroundColor)
        .onTapGesture {
            withAnimation(.easeInOut) {
                tapGesture.toggle()
                action()
            }
        }
    }
}

// MARK: - Предварительный просмотр
struct HeaderListButtonView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderListButtonView(icon: "chevron.down", title: "Price", action: {})
            .previewLayout(.sizeThatFits)
    }
}

