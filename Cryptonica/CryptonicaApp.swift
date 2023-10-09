//
//  CryptonicaApp.swift
//  Cryptonica
//
//  Created by Максим Боталов on 27.09.2023.
//

import SwiftUI

@main
struct CryptonicaApp: App {
    
    // MARK: - ОБЪЕКТЫ СРЕДЫ ОКРУЖЕНИЯ
    @StateObject private var homeScreenViewModel = HomeViewModel()
    
    // MARK: - ТЕЛО
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(homeScreenViewModel)
            
//            DetailView(coin: PreDev.instance.coin)
        }
    }
}
