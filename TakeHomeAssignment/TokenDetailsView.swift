//
//  TokenDetailsView.swift
//  TakeHomeAssignment
//
//  Created by 卢小姐 on 8/11/23.
//

import Foundation
import UIKit

class TokenDetailsView : UIViewController {
    
    var token: Token
    
    // UI Components
    // Create a label for tokenName
    private let tokenNameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    // Create a label for tokenPrice
    private let tokenPriceLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    
    // Create a label for priceIncrease
    private let priceIncreaseLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    // Create a label for tradingVolume
    private let tradingVolumeLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    // Create a label for marketCap
    private let marketCapLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Initialize
    init(token: Token) {
        self.token = token
        // UIViewController will initialize without nib file
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not found")
    }
    
    // Add each label to the TokenDetailsView hierarchy
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(tokenNameLabel)
        view.addSubview(tokenPriceLabel)
        view.addSubview(priceIncreaseLabel)
        view.addSubview(tradingVolumeLabel)
        view.addSubview(marketCapLabel)
        
        // Ensure constraints are applied before the view appears
        labelConstraints()
        // Ensure data are displayed when the view become visible
        configure()
    }
    
    // Setup Auto Layout
    private func labelConstraints() {
        tokenNameLabel.translatesAutoresizingMaskIntoConstraints = false
        tokenPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceIncreaseLabel.translatesAutoresizingMaskIntoConstraints = false
        tradingVolumeLabel.translatesAutoresizingMaskIntoConstraints = false
        marketCapLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Arrange the layout for each label
        NSLayoutConstraint.activate([
            tokenNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tokenNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            
            tokenPriceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tokenPriceLabel.centerYAnchor.constraint(equalTo: tokenNameLabel.bottomAnchor, constant: 20),
            
            priceIncreaseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            priceIncreaseLabel.topAnchor.constraint(equalTo: tokenPriceLabel.bottomAnchor, constant: 20),
            
            tradingVolumeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tradingVolumeLabel.topAnchor.constraint(equalTo:priceIncreaseLabel.bottomAnchor, constant: 20),
            
            marketCapLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            marketCapLabel.topAnchor.constraint(equalTo: tradingVolumeLabel.bottomAnchor, constant: 20)
        ])
    }
    
    // MARK: - Configure content for detail page
    private func configure() {
        tokenNameLabel.text = "Token: \(token.tokenName)"
        tokenNameLabel.textColor = .systemYellow
        tokenPriceLabel.text = String(format: "Price: %.2f", token.tokenPrice)
        
        // Set price increase or decrease color
        if token.priceIncrease > 0 {
            priceIncreaseLabel.text = "Price Increased: +\(token.priceIncrease)%"
            priceIncreaseLabel.textColor = .systemGreen
        } else if token.priceIncrease < 0 {
            priceIncreaseLabel.text = "Price Decreased: \(token.priceIncrease)%"
            priceIncreaseLabel.textColor = .red
        } else {
            priceIncreaseLabel.text = "Price remain: \(token.priceIncrease)%"
            priceIncreaseLabel.textColor = .darkGray
        }
        
        tradingVolumeLabel.text = String(format: "Trading Volume: $%.2fB", token.tradingVolume ?? 1.25)
        marketCapLabel.text = String(format: "Market Cap: $%.2fM", token.marketCap ?? 2.1)
        
        
    }
    
    
}
