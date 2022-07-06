//
//  AvatarView.swift
//  Birthdays
//
//  Created by Seraphim Kovalchuk on 06.07.2022.
//

import SwiftUI

struct AvatarView: View {
    var friend: Friend
    var size: CGFloat
    var fontSize: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.avatarGrey)
            
            Group {
                if let firstName = friend.firstName {
                    Text(firstName.prefix(1))
                }
                
                if let lastName = friend.lastName {
                    Text(lastName.prefix(1))
                }
            }
            .font(.system(size: fontSize, weight: .bold))
            .foregroundColor(.black)
        }
        .frame(width: size, height: size)
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(friend: .testFriend,
                   size: 50,
                   fontSize: 20)
    }
}
