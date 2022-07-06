//
//  FriendModel.swift
//  Birthdays
//
//  Created by Seraphim Kovalchuk on 06.07.2022.
//

import Foundation

struct FriendListModel: Codable {
    let results: [FriendModel]
}

struct FriendModel: Codable {
    let name: FriendNameModel
    let additionalInfo: FriendDateModel
    
    private enum CodingKeys: String, CodingKey {
        case name
        case additionalInfo = "dob"
    }
}

struct FriendDateModel: Codable {
    let date: String
    let age: Int
}

struct FriendNameModel: Codable {
    let firstName, lastName: String
    
    private enum CodingKeys: String, CodingKey {
        case firstName = "first"
        case lastName = "last"
    }
}
