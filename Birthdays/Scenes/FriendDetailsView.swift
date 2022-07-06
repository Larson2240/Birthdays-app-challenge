//
//  FriendDetailsView.swift
//  Birthdays
//
//  Created by Seraphim Kovalchuk on 06.07.2022.
//

import SwiftUI

struct FriendDetailsView: View {
    @Environment(\.dismiss) private var dismiss
    
    var friend: Friend
    
    var body: some View {
        content
            .navigationBarHidden(true)
    }
    
    private var content: some View {
        VStack(spacing: 16) {
            Spacer()
            
            AvatarView(friend: friend, size: 100, fontSize: 50)
            
            Spacer()
            
            if let firstName = friend.firstName, let lastName = friend.lastName {
                Text("\(firstName) \(lastName)")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.black)
            }
            
            if let age = friend.age {
                Text("\(age) years old")
                    .font(.system(size: 16))
                    .foregroundColor(.lightGrey)
            }
            
            Spacer()
            
            backButton
            
            Spacer()
        }
    }
    
    private var backButton: some View {
        Button(action: { dismiss() }) {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .foregroundColor(.black)
                
                Text("GO BACK")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
            }
        }
        .frame(height: 50)
        .padding(.horizontal)
    }
}

struct FriendDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetailsView(friend: .testFriend)
    }
}
