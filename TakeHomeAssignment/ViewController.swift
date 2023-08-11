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
        // Use auto layout
        table.translatesAutoresizingMaskIntoConstraints = false
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
        
        // Set up constraints for tableView (top, bottom, left, right)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }


}

// Handle row selection
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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

