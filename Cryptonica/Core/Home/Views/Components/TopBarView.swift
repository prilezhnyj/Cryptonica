//
//  TopBarView.swift
//  Cryptonica
//
//  Created by Максим Боталов on 27.09.2023.
//

import SwiftUI

struct TopBarView: View {
    
    // MARK: - Входные параметры
    @Binding var headline: String
    @Binding var subheadline: String
    @Binding var searchText: String
    @Binding var searchBarIsActive: Bool
    @Binding var showSettingsView: Bool
    
    // MARK: - Тело
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            if searchBarIsActive == false {
                VStack(alignment: .leading, spacing: 0) {
                    Text(headline)
                        .font(.headline26)
                        .foregroundColor(Color.customTheme.primaryTextColor)
                    
                    Text(subheadline)
                        .font(.regular14)
                        .foregroundColor(Color.customTheme.secondaryTextColor)
                }
                
                Spacer()
            }
            
            SearchBarView(searchBarIsActive: $searchBarIsActive, searchText: $searchText)
            
            Image("Avatar")
                .resizable()
                .frame(width: 48, height: 48, alignment: .center)
                .clipShape(Circle())
                .shadow(radius: 10)
                .onTapGesture {
                    showSettingsView.toggle()
                }
        }
        .padding(.horizontal)
        .padding(.top)
        .background(Color.customTheme.primaryBackgroundColor)
    }
}

// MARK: - Предварительный просмотр
struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarView(headline: .constant("Headline"), subheadline: .constant("Subheadline"), searchText: .constant(""), searchBarIsActive: .constant(false), showSettingsView: .constant(false))
            .previewLayout(.sizeThatFits)
    }
}
