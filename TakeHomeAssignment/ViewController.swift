//
//  ViewController.swift
//  TakeHomeAssignment
//
//  Created by 卢小姐 on 8/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    // Provide data from `TokenModel` for view controller
    let tokenInfo = TokenModel()

    // Create Table View
    lazy var tableView: UITableView = {
        let table = UITableView()
        // Respond to delegate method (row selection)
        table.delegate = self
        // Provide data to table view
        table.dataSource = self
        table.register(TokenListView.self, forCellReuseIdentifier: "cell")
        return table
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(tableView)
        // Use auto layout
        tableView.translatesAutoresizingMaskIntoConstraints = false
        // Set up constraints for tableView (top, bottom, left, right)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        self.title = "Token List"
    }


}

// Handle row selection
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let token = tokenInfo.list?.tokens[indexPath.row] {
            let tokenDetails = TokenDetailsView(token: token)
            self.navigationController?.pushViewController(tokenDetails, animated: true)
        }
    }
}

// Provide data sources (number of rows and cells for each row)
extension ViewController: UITableViewDataSource {
    // Return number of tokens
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tokenInfo.list?.tokens.count ?? 0
    }
    
    // Return cells for each given row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TokenListView
        // Access tokens array from list and get token at specified row
        if let token = tokenInfo.list?.tokens[indexPath.row] {
            // Configure the cell with token's data
            cell.configure(with: token)
        }
        return cell
    }
}

