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
    private var items: FetchedResults<Friend>
    
    var body: some View {
        content
            .navigationBarHidden(true)
    }
    
    private var content: some View {
        NavigationView {
            
        }
    }
}

struct FriendListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendListView()
    }
}
