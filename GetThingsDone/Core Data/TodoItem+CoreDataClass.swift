//
//  TodoItem+CoreDataClass.swift
//  GetThingsDone
//
//  Created by John Salvador on 10/6/22.
//
//

import Foundation
import CoreData

@objc(TodoItem)
public class TodoItem: NSManagedObject {
    convenience init(id: UUID = UUID(), title: String, status: Bool = false) {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "TodoItem", in: context)!
        self.init(entity: entity, insertInto: context)
        self.id = id
        self.title = title
        self.status = status
    }
}
