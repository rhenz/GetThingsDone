//
//  TodoItem.swift
//  GetThingsDone
//
//  Created by John Salvador on 10/4/22.
//

import Foundation

struct TodoItem: Identifiable, Equatable {
    var id: UUID = UUID()
    var title: String
    var status: Bool
}

// MARK: - Test Data
extension TodoItem {
    static func createTestData() -> [TodoItem] {
        [
            .init(title: "Cook Angela's favorite food", status: false),
            .init(title: "Buy some baby food for Lucas", status: true),
            .init(title: "Fix the drainage", status: false)
        ]
    }
}
