//
//  FriendDetailsView.swift
//  Birthdays
//
//  Created by Seraphim Kovalchuk on 06.07.2022.
//

import SwiftUI

struct FriendDetailsView: View {
    var friend: Friend
    
    var body: some View {
        content
            .navigationBarHidden(true)
    }
    
    private var content: some View {
        VStack {
            
        }
    }
}

struct FriendDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetailsView(friend: .testFriend)
    }
}
