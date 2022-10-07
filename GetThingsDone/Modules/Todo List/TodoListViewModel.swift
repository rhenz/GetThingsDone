//
//  TodoListViewModel.swift
//  GetThingsDone
//
//  Created by John Salvador on 10/8/22.
//

import Foundation

final class TodoListViewModel {
    
    // MARK: - Properties
    private var allTodoItems: [TodoItem]
    
    // MARK: - Init
    init() {
        allTodoItems = TodoItem.createTestData()
    }
    
    // MARK: - Public API
    var itemsLeftCount: Int {
        allTodoItems.filter { !$0.status }.count
    }
    
    var todos: [TodoItem] {
        allTodoItems.filter { !$0.status }
    }
    
    var doneTodos: [TodoItem] {
        allTodoItems.filter { $0.status }
    }
    
    func fetchTodoItems() {
        // Fetch todo items from core data
    }
}
