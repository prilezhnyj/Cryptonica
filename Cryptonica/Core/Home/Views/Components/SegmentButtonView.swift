//
//  SegmentButtonView.swift
//  Cryptonica
//
//  Created by Максим Боталов on 27.09.2023.
//

import SwiftUI

struct SegmentButtonView: View {
    
    // MARK: - Входные параметры
    var title: String
    var isActive: Bool
    var action: () -> Void
    
    // MARK: - Объекты среды окружения
    @Environment(\.colorScheme) private var colorScheme
    
    // MARK: - Тело
    var body: some View {
        Text(title)
            .font(.semibold14)
            .foregroundColor(isActive ? Color.customTheme.activeButtonText : Color.customTheme.inactiveButtonText)
            .frame(height: 32, alignment: .center)
            .padding(.horizontal)
            .background(isActive ? Color.customTheme.activeButtonBackground : Color.customTheme.inactiveButtonBackground)
            .clipShape(Capsule(style: .continuous))
            .shadow(radius: isActive && colorScheme == .dark ? 0 : 3)
            .overlay(alignment: .center, content: {
                if colorScheme == .dark {
                    Capsule(style: .continuous)
                        .stroke(lineWidth: 1)
                        .foregroundColor(isActive ? Color.customTheme.inactiveButtonBackground : Color.customTheme.activeButtonBackground)
                }
            })
            .onTapGesture {
                DispatchQueue.main.async {
                    withAnimation(.easeInOut) {
                        action()
                    }
                }
            }
    }
}

// MARK: - Предварительный просмотр
struct SegmentButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentButtonView(title: "⚙️ Settings", isActive: true, action: {})
            .previewLayout(.sizeThatFits)
    }
}
