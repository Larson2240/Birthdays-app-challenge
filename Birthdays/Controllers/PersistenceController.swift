//
//  PersistenceController.swift
//  Birthdays
//
//  Created by Seraphim Kovalchuk on 06.07.2022.
//

import CoreData

final class PersistenceController: ObservableObject {
    static let shared = PersistenceController()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Birthdays")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        container.viewContext.automaticallyMergesChangesFromParent = true
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func save() {
        guard context.hasChanges else { return }
        
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            print("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    func removeObject<T: NSManagedObject>(_ object: T) {
        context.delete(object)
        save()
    }
    
    func friendExists(firstName: String) -> Bool {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Friend")
        fetchRequest.predicate = NSPredicate(format: "firstName == %@", firstName)
        fetchRequest.fetchLimit = 1
        fetchRequest.includesSubentities = false
        
        var count = 0
        
        do {
            count = try context.count(for: fetchRequest)
        }
        catch let error as NSError {
            print("error executing fetch request: \(error)")
        }
        
        return count > 0
    }
}
