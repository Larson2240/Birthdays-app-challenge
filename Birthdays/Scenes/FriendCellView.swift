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
        HStack(spacing: 16) {
            AvatarView(friend: friend, size: 38)
            
            friendDetails
            
            Spacer()
        }
        .padding(16)
    }
    
    private var friendDetails: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let firstName = friend.firstName, let lastName = friend.lastName {
                Text("\(firstName) \(lastName)")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.black)
            }
            
            if let birthDate = friend.birthDate {
                Text(DateFormatter.friendDateFormatter.string(from: birthDate))
                    .font(.system(size: 12))
                    .foregroundColor(.dateGrey)
            }
        }
    }
}

struct FriendCellView_Previews: PreviewProvider {
    static var previews: some View {
        FriendCellView(friend: .testFriend)
            .previewLayout(.sizeThatFits)
    }
}
