//
//  TodoItem+CoreDataProperties.swift
//  GetThingsDone
//
//  Created by John Salvador on 10/6/22.
//
//

import Foundation
import CoreData


extension TodoItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoItem> {
        return NSFetchRequest<TodoItem>(entityName: "TodoItem")
    }

    @NSManaged public var id: UUID
    @NSManaged public var title: String
    @NSManaged public var status: Bool

}

extension TodoItem : Identifiable {

}

// MARK: - Test Data
extension TodoItem {
    static func createTestData() -> [TodoItem] {
        [
            .init(title: "Cook Angela's favorite food", status: false),
            .init(title: "Buy some baby food for Lucas", status: true),
            .init(title: "Cook Angela's favorite food", status: false),
            .init(title: "Fix the drainage", status: false)
        ]
    }
}
