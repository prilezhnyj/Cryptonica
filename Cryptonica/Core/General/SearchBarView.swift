//
//  SearchBarView.swift
//  Cryptonica
//
//  Created by Максим Боталов on 28.09.2023.
//

import SwiftUI

struct SearchBarView: View {
    
    // MARK: - Входные параметры
    @Binding var searchBarIsActive: Bool
    @Binding var searchText: String
    
    // MARK: - Объекты среды окружения
    @Environment(\.colorScheme) private var colorScheme
    @FocusState private var focused: Bool
    
    // MARK: - Тело
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Image(systemName: "magnifyingglass")
                .font(.headline16)
                .foregroundColor(searchBarIsActive ? Color.customTheme.secondaryTextColor : Color.customTheme.primaryTextColor)
                .frame(width: searchBarIsActive == true ? 34 : 50, height: 50, alignment: searchBarIsActive == true ? . leading : .center)
            
            if searchBarIsActive {
                TextField("Start typing...", text: $searchText, axis: .horizontal)
                    .font(.headline16)
                    .autocorrectionDisabled()
                    .focused($focused)
                
                Spacer()
                
                Image(systemName: "xmark")
                    .opacity(searchBarIsActive ? 1 : 0)
                    .font(.headline16)
                    .foregroundColor(Color.customTheme.secondaryTextColor)
                    .frame(width: 50, height: 50, alignment: .center)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            searchText = ""
                            focused = false
                            searchBarIsActive = false
                        }
                    }
            }
        }
        .frame(maxWidth: searchBarIsActive ? .infinity : 48, alignment: searchBarIsActive ? .leading : .center)
        .frame(height: 48)
        .background(Color.customTheme.primaryBackgroundColor)
        .onTapGesture {
            withAnimation(.easeInOut) {
                searchBarIsActive = true
            }
        }
    }
}

// MARK: - Предварительный просмотр
struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchBarIsActive: .constant(true), searchText: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
