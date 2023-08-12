//
//  Utils.swift
//  TakeHomeAssignment
//
//  Created by 卢小姐 on 8/11/23.
//

import Foundation
import UIKit

extension UILabel {
    static func createLabel(_ fontSize: CGFloat,_ weight: UIFont.Weight, _ alignment: NSTextAlignment = .left) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        label.textAlignment = alignment
        return label
    }
}

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
