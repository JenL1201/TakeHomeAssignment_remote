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
    
    private lazy var tokenNameLabel : UILabel = {
        UILabel.createLabel(26, .bold, .center)
    }()
    
    private lazy var tokenPriceLabel : UILabel = {
        UILabel.createLabel(22, .medium, .center)
    }()
    
    private lazy var priceIncreaseLabel : UILabel = {
        UILabel.createLabel(18, .regular, .center)
    }()

    private lazy var tradingVolumeLabel : UILabel = {
        UILabel.createLabel(16, .regular, .center)
    }()
    
    private lazy var marketCapLabel : UILabel = {
        UILabel.createLabel(16, .regular, .center)
    }()
    
    // MARK: - Initialize
    init(token: Token) {
        self.token = token
        // UIViewController will initialize without nib file
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        print("Intialization is not supported.")
        return nil
    }
    
    
    private func styleInfoBox(_ box: UIView) {
        box.layer.borderWidth = 0.2
        box.layer.borderColor = UIColor.gray.cgColor
        box.layer.cornerRadius = 10
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        // Create the UIView box layout
        let infoBox = UIView()
        infoBox.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(infoBox)

        // Add the labels into the box layout
        infoBox.addSubview(tokenPriceLabel)
        infoBox.addSubview(tradingVolumeLabel)
        infoBox.addSubview(marketCapLabel)

        // Add the other labels directly to the main view
        view.addSubview(tokenNameLabel)
        view.addSubview(priceIncreaseLabel)

        // Ensure constraints are applied before the view appears
        labelConstraints(box: infoBox)
        styleInfoBox(infoBox)
        // Ensure data are displayed when the view become visible
        configure()
    }

    // MARK: - Constraints for each label
    private func labelConstraints(box: UIView) {
        tokenNameLabel.translatesAutoresizingMaskIntoConstraints = false
        priceIncreaseLabel.translatesAutoresizingMaskIntoConstraints = false
        tokenPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        tradingVolumeLabel.translatesAutoresizingMaskIntoConstraints = false
        marketCapLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Arrange layout constraints for each label in TokenDetailsView
        NSLayoutConstraint.activate([
            box.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            box.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            tokenPriceLabel.topAnchor.constraint(equalTo: box.topAnchor, constant: -30),
            tokenPriceLabel.leadingAnchor.constraint(equalTo: box.leadingAnchor, constant: 10),

            tradingVolumeLabel.topAnchor.constraint(equalTo: tokenPriceLabel.bottomAnchor, constant: -30),
            tradingVolumeLabel.leadingAnchor.constraint(equalTo: box.leadingAnchor, constant: 10),

            marketCapLabel.centerYAnchor.constraint(equalTo: tradingVolumeLabel.centerYAnchor),
            marketCapLabel.leadingAnchor.constraint(equalTo: tradingVolumeLabel.trailingAnchor, constant: 20),

            box.trailingAnchor.constraint(equalTo: marketCapLabel.trailingAnchor, constant: 10),
            box.bottomAnchor.constraint(equalTo: tradingVolumeLabel.bottomAnchor, constant: 40),
            box.heightAnchor.constraint(equalToConstant: 180),

            tokenNameLabel.bottomAnchor.constraint(equalTo: box.topAnchor, constant: -20),
            tokenNameLabel.leadingAnchor.constraint(equalTo: box.leadingAnchor),

            priceIncreaseLabel.centerYAnchor.constraint(equalTo: tokenNameLabel.centerYAnchor),
            priceIncreaseLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    
        ])
    }
    
    // MARK: - Configure content for detail page
    private func configure() {
        tokenNameLabel.text = "\(token.tokenName)"
        
        let tokenPrices = customFormattedPrice(token.tokenPrice)
        tokenPriceLabel.text = "Price: $\(tokenPrices)"
        
        // Assign text and textColor according to the priceIncreaseLabel by applying `priceUpdate` method in TokenModel
        priceIncreaseLabel.text = token.priceUpdate.text
        priceIncreaseLabel.textColor = token.priceUpdate.color
        
        tradingVolumeLabel.text = String(format: "Trading Volume: $%.2fB", token.tradingVolume ?? 1.25)
        marketCapLabel.text = String(format: "Market Cap: $%.2fM", token.marketCap ?? 2.1)
    }
}
