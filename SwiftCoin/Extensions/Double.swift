//
//  Double.swift
//  SwiftCoin
//
//  Created by Krishnatrea on 29/09/23.
//

import Foundation


extension Double {
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }

    private var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    private var rankFormatter: NumberFormatter {
        let formatter = NumberFormatter()
//        formatter.numberStyle =
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    
    func toPercent() -> String {
        return (numberFormatter.string(for: self) ?? "0.00") + "%"
    }
 
    func toCurrency() -> String {
      return currencyFormatter.string(for: self) ?? "$0.00"
    }
}
