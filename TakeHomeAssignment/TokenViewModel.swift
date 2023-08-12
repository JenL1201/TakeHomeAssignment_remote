//
//  TokenViewModel.swift
//  TakeHomeAssignment
//
//  Created by 卢小姐 on 8/11/23.
//

import Foundation

class TokenViewModel {
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
        
       // Convert into Data object
        let data = jsonString.data(using: .utf8)
        do {
            // Decode Data object into TokenResponse object
            let f = try JSONDecoder().decode(TokenResponse.self, from: data!)
            self.list = f
        } catch {
            // Handle error (if JSON does not match the `TokenResponse`)
            print("Error parsing JSON data: \(error)")
        }
    }
    
    
}
