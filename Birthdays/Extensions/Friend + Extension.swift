//
//  Friend + Extension.swift
//  Birthdays
//
//  Created by Seraphim Kovalchuk on 06.07.2022.
//

import Foundation

extension Friend {
    static var testFriend: Friend {
        let friend = Friend(context: PersistenceController.shared.context)
        friend.firstName = "FirstName"
        friend.lastName = "LastName"
        friend.birthDate = Date()
        
        return friend
    }
}
