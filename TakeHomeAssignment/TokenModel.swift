//
//  TokenModel.swift
//  TakeHomeAssignment
//
//  Created by 卢小姐 on 8/11/23.
//

import Foundation

class TokenModel {
    // Create a list that is type of `TokenResponse`
    var list : TokenResponse?
    
    init() {
        //  // hardcoded JSON string(`jsonString`)
        let jsonString = """
      {
      "tokens": [
      {"token_name": "Bitcoin", "token_price": 45678.23, "price_increase": 2.45},
      {"token_name": "Ethereum", "token_price": 3123.45, "price_increase": 3.67},
      {"token_name": "Binance Coin", "token_price": 425.60, "price_increase": -0.45},
      {"token_name": "Cardano", "token_price": 2.15, "price_increase": 1.30},
      {"token_name": "Solana", "token_price": 145.67, "price_increase": 4.56},
      {"token_name": "Ripple", "token_price": 0.90, "price_increase": -2.30},
      {"token_name": "Polkadot", "token_price": 28.75, "price_increase": 0.75},
      {"token_name": "USD Coin", "token_price": 1.00, "price_increase": 0.00},
      {"token_name": "Dogecoin", "token_price": 0.24, "price_increase": -1.23},
      {"token_name": "Avalanche", "token_price": 68.90, "price_increase": 5.89},
      {"token_name": "Uniswap", "token_price": 25.34, "price_increase": 2.45},
      {"token_name": "Litecoin", "token_price": 175.32, "price_increase": 1.34},
      {"token_name": "Chainlink", "token_price": 24.56, "price_increase": -0.56},
      {"token_name": "Bitcoin Cash", "token_price": 543.21, "price_increase": 0.21},
      {"token_name": "Stellar", "token_price": 0.32, "price_increase": -1.12},
      {"token_name": "Polygon", "token_price": 1.45, "price_increase": 0.67},
      {"token_name": "VeChain", "token_price": 0.12, "price_increase": 3.21},
      {"token_name": "EOS", "token_price": 4.23, "price_increase": -0.34},
      {"token_name": "TRON", "token_price": 0.09, "price_increase": 1.23},
      {"token_name": "Shiba Inu", "token_price": 0.000024, "price_increase": 4.56},
      {"token_name": "Tezos", "token_price": 4.56, "price_increase": 2.34},
      {"token_name": "Aave", "token_price": 312.45, "price_increase": -2.12},
      {"token_name": "Crypto.com Coin", "token_price": 0.18, "price_increase": 1.45},
      {"token_name": "Monero", "token_price": 242.34, "price_increase": 0.67},
      {"token_name": "PancakeSwap", "token_price": 19.23, "price_increase": 3.21}
      ] }
    """
        
       // Concert into `Data` object
        let data = jsonString.data(using: .utf8)
        do {
            // Decode `Data` object into `TokenResponse` object
            let f = try JSONDecoder().decode(TokenResponse.self, from: data!)
            self.list = f
        } catch {
            // Handle error (if JSON does not match the `TokenResponse`)
            print(error)
        }
    }
    
    // Codable: structure can be endoded or decoded
    struct TokenResponse : Codable {
        
        // Customize keys "tokens"
        enum CodingKeys : String, CodingKey {
            case tokens = "tokens"
        }
        
        var tokens : [Token]
    }

    struct Token: Codable {
        
        // Customize five keys: "token_name", "token_price", "price_increase", "trading_volume" and "market_cap"
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
        // optional because it may be nil
        var tradingVolume : Float?
        var marketCap : Float?
        
        // Create Token instance using JSONDecoder
        init(from decoder: Decoder) throws {
            // Use custom keys that defined above to create a container for decoding
            let container = try decoder.container(keyedBy: CodingKeys.self)
            // Decode string value addociated with "tokenName" and assign it to self.tokenName
            self.tokenName = try container.decode(String.self, forKey: .tokenName)
            self.tokenPrice = try container.decode(Float.self, forKey: .tokenPrice)
            self.priceIncrease = try container.decode(Float.self, forKey: .priceIncrease)
        }

    }
}


