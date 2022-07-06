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
        HStack(spacing: 20) {
            avatarView
            
            friendDetails
            
            Spacer()
        }
        .padding(20)
    }
    
    private var avatarView: some View {
        ZStack {
            Circle()
                .frame(width: 38, height: 38)
                .foregroundColor(.avatarGrey)
            
            Group {
                if let firstName = friend.firstName {
                    Text(firstName.prefix(1))
                }
                if let lastName = friend.lastName {
                    Text(lastName.prefix(1))
                }
            }
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(.black)
        }
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
        FriendCellView(friend: Friend.testFriend)
            .previewLayout(.sizeThatFits)
    }
}
