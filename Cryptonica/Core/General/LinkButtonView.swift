//
//  LinkButtonView.swift
//  Cryptonica
//
//  Created by Максим Боталов on 09.10.2023.
//

import SwiftUI

struct LinkButtonView: View {
    
    var icon: String
    var title: String
    var action: () -> Void
    
    // MARK: - Объекты среды окружения
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        Button {
            withAnimation(.easeInOut) {
                action()
            }
        } label: {
            HStack(alignment: .center, spacing: 8) {
                Image(icon)
                    .resizable()
                    .frame(width: 20, height: 20, alignment: .center)
                
                Text(title)
            }
            .font(.semibold14)
            .foregroundColor(Color.customTheme.inactiveButtonText)
            .frame(height: 32, alignment: .center)
            .padding(.horizontal, 8)
            .background(Color.customTheme.inactiveButtonBackground)
            .clipShape(Capsule(style: .continuous))
            .shadow(color: colorScheme == .light ? Color.customTheme.secondaryBackgroundColor : Color.customTheme.secondaryBackgroundColor.opacity(0.5), radius: 10, x: 0, y: 0)
        }
    }
}

struct LinkButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LinkButtonView(icon: "LogoReddit", title: "Reddit", action: {})
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
