//
//  ViewController.swift
//  MVVM
//
//  Created by Ayush Pogra on 20/09/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var userResponseViewModel = UserViewModel()
    
    var user: [UserResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate   = self
        tableView.dataSource = self
        
        userResponseViewModel.reloadTableView = { [weak self] in
            self?.tableView.reloadData()
        }
        
        loadData()
    }
    
    func loadData() {
        let urlString = "https://api.example.com/users"
        userResponseViewModel.loadData()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userResponseViewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
        let user = userResponseViewModel.users[indexPath.row]
        cell.textLabel?.text = user.name
        return cell
    }
}
