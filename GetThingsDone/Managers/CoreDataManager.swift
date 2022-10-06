//
//  CoreDataManager.swift
//  GetThingsDone
//
//  Created by John Salvador on 10/6/22.
//

import Foundation
import CoreData

final class CoreDataManager {
    
    // MARK: - Shared
    static let shared = CoreDataManager()
    
    // MARK: - Init
    private init() { }
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "GetThingsDone")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
