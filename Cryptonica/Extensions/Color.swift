//
//  Color.swift
//  Cryptonica
//
//  Created by Максим Боталов on 27.09.2023.
//

import SwiftUI

extension Color {
    static let customTheme = CustomTheme()
}

struct CustomTheme {
    let primaryBackgroundColor = Color("PrimaryBackgroundColor")
    let secondaryBackgroundColor = Color("SecondaryBackgroundColor")
    
    let primaryTextColor = Color("PrimaryTextColor")
    let secondaryTextColor = Color("SecondaryTextColor")
    
    let activeButtonBackground = Color("ActiveButtonBackground")
    let inactiveButtonBackground = Color("InactiveButtonBackground")
    
    let activeButtonText = Color("ActiveButtonText")
    let inactiveButtonText = Color("InactiveButtonText")
}
