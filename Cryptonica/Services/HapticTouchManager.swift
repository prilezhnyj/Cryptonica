//
//  HapticTouchManager.swift
//  Cryptonica
//
//  Created by Максим Боталов on 03.10.2023.
//

import SwiftUI

class HapticTouchManager {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
