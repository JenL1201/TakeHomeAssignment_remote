//
//  TokenModel.swift
//  TakeHomeAssignment
//
//  Created by 卢小姐 on 8/11/23.
//

import Foundation
import UIKit

struct TokenResponse : Codable {
    // Customize keys "tokens"
    enum CodingKeys : String, CodingKey {
        case tokens = "tokens"
    }
    
    var tokens : [Token]
}

struct Token: Codable {
    enum CodingKeys : String, CodingKey {
        // Maps each key in the JSON string to each property name
        case tokenName = "token_name"
        case tokenPrice = "token_price"
        case priceIncrease = "price_increase"
        case tradingVolume = "trading_volume"
        case marketCap = "market_cap"
    }
    
    // Declare types of each property
    var tokenName : String
    var tokenPrice : Float
    var priceIncrease : Float
    var tradingVolume : Float?
    var marketCap : Float?
    
    // Create Token instance using JSONDecoder
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // Decode string value addociated with "tokenName"
        self.tokenName = try container.decode(String.self, forKey: .tokenName)
        self.tokenPrice = try container.decode(Float.self, forKey: .tokenPrice)
        self.priceIncrease = try container.decode(Float.self, forKey: .priceIncrease)
    }
}

// Set text color for price change
extension Token {
    var priceUpdate: (text: String, color: UIColor) {
        if priceIncrease > 0 {
            return (String(format: "+%.2f%%", priceIncrease), .systemGreen)
        } else if priceIncrease < 0 {
            return (String(format: "%.2f%%", priceIncrease), .red)
        } else {
            return (String(format: "%.2f%%", priceIncrease), .darkGray)
        }
    }
}


