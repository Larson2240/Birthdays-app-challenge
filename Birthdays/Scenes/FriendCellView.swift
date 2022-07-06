//
//  FriendCellView.swift
//  Birthdays
//
//  Created by Seraphim Kovalchuk on 06.07.2022.
//

import SwiftUI

struct FriendCellView: View {
    var friend: Friend
    
    var body: some View {
        HStack {
            avatarView
        }
    }
    
    private var avatarView: some View {
        ZStack {
            
        }
    }
    
    private var friendDetails: some View {
        VStack {
            
        }
    }
}

struct FriendCellView_Previews: PreviewProvider {
    static var previews: some View {
        FriendCellView(friend: Friend.testFriend)
    }
}
