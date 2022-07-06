//
//  FriendListView.swift
//  Birthdays
//
//  Created by Seraphim Kovalchuk on 06.07.2022.
//

import SwiftUI
import CoreData

struct FriendListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Friend.birthDate, ascending: true)],
        animation: .default)
    private var friends: FetchedResults<Friend>
    
    var body: some View {
        content
            .navigationBarHidden(true)
    }
    
    private var content: some View {
        NavigationView {
            VStack(spacing: 0) {
                header
                
                friendsList
            }
        }
    }
    
    private var header: some View {
        Text("Birthdays")
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.black)
    }
    
    private var friendsList: some View {
        List {
            ForEach(friends) { friend in
                FriendCellView(friend: friend)
            }
        }
    }
}

struct FriendListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendListView()
    }
}
