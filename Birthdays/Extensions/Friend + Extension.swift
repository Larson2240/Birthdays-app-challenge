//
//  Friend + Extension.swift
//  Birthdays
//
//  Created by Seraphim Kovalchuk on 06.07.2022.
//

import Foundation

extension Friend {
    static var testFriend: Friend {
        let friend = Friend(entity: Friend.entity(), insertInto: nil)
        friend.firstName = "FirstName"
        friend.lastName = "LastName"
        friend.birthDate = Date()
        
        return friend
    }
}
