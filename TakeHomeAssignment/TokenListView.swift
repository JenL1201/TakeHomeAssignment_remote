//
//  TokenListView.swift
//  TakeHomeAssignment
//
//  Created by 卢小姐 on 8/11/23.
//

import Foundation
import UIKit

class TokenListView: UITableViewCell {
    
    // Create a label for tokenName
    private let tokenNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    // Create a label for tokenPrice
    private let tokenPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    // Create a label for priceIncrease
    private let priceIncreaseLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    
    // MARK: - Initialize
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        // Call superclass `UITableViewCell` initializer
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Add each label to the view
        addSubview(tokenNameLabel)
        addSubview(tokenPriceLabel)
        addSubview(priceIncreaseLabel)
        labelConstraints()
    }
    
    private func labelConstraints() {
        tokenNameLabel.translatesAutoresizingMaskIntoConstraints = false
        tokenPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceIncreaseLabel.translatesAutoresizingMaskIntoConstraints = false

        // Auto Layout constraints
        NSLayoutConstraint.activate([
            tokenNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            tokenNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),

            tokenPriceLabel.topAnchor.constraint(equalTo: tokenNameLabel.bottomAnchor, constant: 5),
            tokenPriceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),

            priceIncreaseLabel.topAnchor.constraint(equalTo: tokenPriceLabel.bottomAnchor, constant: 5),
            priceIncreaseLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            priceIncreaseLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
    
    // Needed for subclassing `UITableViewCell` above
    required init?(coder: NSCoder) {
        fatalError("Not found")
    }
    
    // MARK: - Configure content for each cell
    func configure(with token: Token) {
        tokenNameLabel.text = token.tokenName
        tokenPriceLabel.text = "\(token.tokenPrice)"
        
        // Set price increase or decrease color
        if token.priceIncrease > 0 {
            priceIncreaseLabel.text = "+\(token.priceIncrease)%"
            priceIncreaseLabel.textColor = .green
        } else if token.priceIncrease < 0 {
            priceIncreaseLabel.text = "\(token.priceIncrease)%"
            priceIncreaseLabel.textColor = .red
        } else {
            priceIncreaseLabel.text = "\(token.priceIncrease)%"
            priceIncreaseLabel.textColor = .darkGray
        }
    }
    
    
}
