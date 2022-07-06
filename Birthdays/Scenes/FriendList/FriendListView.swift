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
        sortDescriptors: [],
        animation: .default)
    private var friends: FetchedResults<Friend>
    
    @StateObject private var viewModel = FriendListViewModel()
    @StateObject private var persistenceController = PersistenceController.shared
    
    var body: some View {
        content
            .navigationBarHidden(true)
            .onAppear {
                viewModel.getFriendsList { results in
                    guard let results = results else { return }
                    
                    for result in results {
                        guard !persistenceController.friendExists(firstName: result.name.firstName) else {
                            continue
                        }
                        
                        let newObject = Friend(context: viewContext)
                        
                        newObject.firstName = result.name.firstName
                        newObject.lastName = result.name.lastName
                        newObject.age = Int16(result.additionalInfo.age)
                        
                        if let date = ISO8601DateFormatter.iso801Formatter.date(from: result.additionalInfo.date) {
                            newObject.birthDate = date
                        }
                    }
                    
                    persistenceController.save()
                }
            }
    }
    
    private var content: some View {
        NavigationView {
            VStack(spacing: 16) {
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
                NavigationLink(destination: FriendDetailsView(friend: friend)) {
                    FriendCellView(friend: friend)
                }
            }
        }
        .listStyle(.plain)
    }
}

struct FriendListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendListView()
    }
}
