//
//  UserResponseService.swift
//  MVVM
//
//  Created by Ayush Pogra on 20/09/24.
//

import Foundation


enum NetworkError: Error {
    case invalidURL
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

class UserResponseService {
    
    func fetchData<T: Decodable>(urlString: String, httpMethod: HTTPMethod, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else
            {
                print("No data received")
                return
                
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch
                let decodingError {
                completion(.failure(decodingError))
                
            }
        }.resume()
    }
}

