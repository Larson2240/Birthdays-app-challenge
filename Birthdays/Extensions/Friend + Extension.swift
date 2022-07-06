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
        friend.name = "FirstName LastName"
        friend.id = "1"
        friend.birthDate = Date()
        
        return friend
    }
}
