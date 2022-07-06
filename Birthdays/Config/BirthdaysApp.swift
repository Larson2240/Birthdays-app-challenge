//
//  BirthdaysApp.swift
//  Birthdays
//
//  Created by Seraphim Kovalchuk on 06.07.2022.
//

import SwiftUI

@main
struct BirthdaysApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            FriendListView()
                .environment(\.managedObjectContext, persistenceController.context)
        }
    }
}
