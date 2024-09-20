//
//  UserViewModel.swift
//  MVVM
//
//  Created by Ayush Pogra on 20/09/24.
//

class UserViewModel {
    
    private let service = UserResponseService()
    var users: [UserResponse] = []
    
    var reloadTableView: (() -> Void)?
    
    func loadData() {
        let urlString = URL.url
        service.fetchData(urlString: urlString, httpMethod: .get) { (result: Result<[UserResponse], Error>) in
            switch result {
            case .success(let users):
                print("Data received: \(users)")
            case .failure(let error):
                print("Error occurred: \(error)")
            }
        }
    }
}
