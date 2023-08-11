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

    // Create a table view
    var tableView : UITableView {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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
        
    }
}

