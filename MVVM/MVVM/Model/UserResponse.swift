//
//  UserResponse.swift
//  MVVM
//
//  Created by Ayush Pogra on 20/09/24.
//

import Foundation

class UserResponse: Decodable {
    var name: String
    
    enum CodingKeys: String, CodingKey {
           case name = "name"
       }
}
