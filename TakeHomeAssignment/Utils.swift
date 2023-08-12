//
//  Utils.swift
//  TakeHomeAssignment
//
//  Created by 卢小姐 on 8/11/23.
//

import Foundation

// Return the formatted price in String
func customFormattedPrice(_ price: Float) -> String {
    let integerPart = Int(price)
    let twoDecimals = price * 100.0
    
    if Float(integerPart) == price {
        return "\(integerPart)"
    } else if Float(Int(twoDecimals)) / 100.0 == price {
        return String(format: "%.2f", price)
    } else {
        return String(format: "%.6f", price)
    }
}
