//
//  String.swift
//  Cryptonica
//
//  Created by Максим Боталов on 09.10.2023.
//

import Foundation

extension String {
    var removingHTML: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
