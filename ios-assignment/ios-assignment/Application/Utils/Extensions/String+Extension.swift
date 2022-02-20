//
//  String+Extension.swift
//  ios-assignment
//
//  Created by Nguyen Ngoc Diep on 2022/02/19.
//

import Foundation

// MARK: - Localized
extension String {
    var localized: String {
        return NSLocalizedString(self, comment: self)
    }

    /// Load the localized string with additional arguments
    /// - Parameter arguments: The list arguments
    /// - Returns: The localized string with the arguments
    func localizedWithFormat(_ arguments: [CVarArg]) -> String {
        let localizedString = String(format: localized, arguments: arguments)
        return localizedString
    }
}
