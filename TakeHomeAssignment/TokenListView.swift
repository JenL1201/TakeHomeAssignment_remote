//
//  TokenListView.swift
//  TakeHomeAssignment
//
//  Created by 卢小姐 on 8/11/23.
//

import Foundation
import UIKit

class TokenListView: UITableViewCell {
    
    // MARK: - Create Label for each Properties
    private func createLabel(_ fontSize: CGFloat,_ weight: UIFont.Weight) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        return label
    }
    
    private lazy var tokenNameLabel: UILabel = {
        createLabel(20, .medium)
    }()
    
    private lazy var tokenPriceLabel: UILabel = {
        createLabel(16, .medium)
    }()
    
    private lazy var priceIncreaseLabel: UILabel = {
        createLabel(16, .medium)
    }()
    
    // Vertical stack view for tokenPriceLabel and priceIncreaseLabel
    private lazy var VStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [tokenPriceLabel, priceIncreaseLabel])
        stack.axis = .vertical
        stack.spacing = 4
        stack.alignment = .trailing
        return stack
    }()
    
    // Horizontal stack view for tokenNameLabel and VStackView
    private lazy var HStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [tokenNameLabel, VStackView])
        stack.axis = .horizontal
        stack.spacing = 12
        stack.alignment = .center
        return stack
    }()
    
    // MARK: - Initialize
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        // Call superclass `UITableViewCell` initializer
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Add HStack View to the TokenListView
        addSubview(HStackView)
        // Apply constraints
        labelConstraints()
    }
    
    // Needed for subclassing `UITableViewCell` above
    required init?(coder: NSCoder) {
        fatalError("Not found")
    }
    
    // MARK: - Constraints for HStackView
    private func labelConstraints() {
        // Setup constraints for layouts
        HStackView.translatesAutoresizingMaskIntoConstraints = false

        // Arrange layouts
        NSLayoutConstraint.activate([
            HStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            HStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            HStackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            HStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    
    // MARK: - Configure content for each cell
    func configure(with token: Token) {
        tokenNameLabel.text = token.tokenName
        let tokenPrices = customFormattedPrice(token.tokenPrice)
        tokenPriceLabel.text = "$\(tokenPrices)"
        
        // Assign text and textColor
        priceIncreaseLabel.text = token.priceUpdate.text
        priceIncreaseLabel.textColor = token.priceUpdate.color
    }
    
    
}
