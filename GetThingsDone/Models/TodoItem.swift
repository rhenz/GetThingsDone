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
            .init(title: "Cook Angela's favorite food", status: false),
            .init(title: "Buy some baby food for Lucas 2", status: true),
            .init(title: "Cook Angela's favorite food 3", status: false),
            .init(title: "Buy some baby food for Lucas 4", status: true),
            .init(title: "Cook Angela's favorite food 5", status: false),
            .init(title: "Buy some baby food for Lucas 6", status: true),
            .init(title: "Cook Angela's favorite food 7", status: false),
            .init(title: "Buy some baby food for Lucas 8", status: true),
            .init(title: "Cook Angela's favorite food 9", status: false),
            .init(title: "Buy some baby food for Lucas 11", status: true),
            .init(title: "Cook Angela's favorite food 22", status: false),
            .init(title: "Buy some baby food for Lucas 33", status: true),
            .init(title: "Cook Angela's favorite food 44", status: false),
            .init(title: "Buy some baby food for Lucas 55", status: true),
            .init(title: "Cook Angela's favorite food 66", status: false),
            .init(title: "Buy some baby food for Lucas 77", status: true),
            .init(title: "Cook Angela's favorite food 88", status: false),
            .init(title: "Buy some baby food for Lucas 99", status: true),
            .init(title: "Cook Angela's favorite food 12", status: false),
            .init(title: "Buy some baby food for Lucas 13", status: true),
            .init(title: "Cook Angela's favorite food 14", status: false),
            .init(title: "Buy some baby food for Lucas 15", status: true),
            .init(title: "Fix the drainage", status: false)
        ]
    }
}
