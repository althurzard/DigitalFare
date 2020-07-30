//
//  Other+Extension.swift
//  digital-fare-lib
//
//  Created by Nguyen Quoc Vuong on 7/28/20.
//

import Foundation

public extension SignedNumeric {
    #if canImport(Foundation)
    /// SwifterSwift: String with number and current locale currency.{
    func asLocaleCurrency(locale: Locale = .current) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = locale
        // swiftlint:disable:next force_cast
        return formatter.string(from: self as! NSNumber)
    }
    #endif

}

public extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        formatter.decimalSeparator =  ","
        return formatter
    }()
}

public extension Numeric {
    var formattedWithSeparator: String { Formatter.withSeparator.string(for: self) ?? "" }
}

public extension String {
    var toDouble: Double? {
        if let number = Formatter.withSeparator.number(from: self) {
            return number.doubleValue
        }
        return nil
    }
    var toInt: Int? {
        if let number = Formatter.withSeparator.number(from: self) {
            return number.intValue
        }
        return nil
    }
}
