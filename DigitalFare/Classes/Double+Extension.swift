//
//  Double+Extension.swift
//  digital-fare-ios
//
//  Created by Nguyen Quoc Vuong on 7/22/20.
//  Copyright © 2020 MLGT. All rights reserved.
//

import Foundation
public extension Double {
    func formatCurrencyUtils(unit: String = "đ", separator: String = ".", decimalSeparator: String = ".") -> String {
        let formatter = NumberFormatter()
        formatter.currencyGroupingSeparator = separator
        formatter.numberStyle = .currency
        var strNumber = formatter.string(for: self) ?? "0"
        strNumber.append(unit)
        strNumber.remove(at: String.Index(utf16Offset: 0, in: strNumber))
        return strNumber
    }
    
    func formatDistance() -> String {
        if (self > 1000) {
            return String(format:"%.1f", self/1000) + "km"
        }
        if self == 0 {
            return "Gần đây"
        }
        return String(format:"%.0f", self) + "m"
    }
}
