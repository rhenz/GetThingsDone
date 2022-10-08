//
//  TodoListViewModel.swift
//  GetThingsDone
//
//  Created by John Salvador on 10/8/22.
//

import UIKit

final class TodoListViewModel {
    
    // MARK: - Properties
    private var allTodoItems: [TodoItem] = []
    private var hasAddedTodoItemTestData: Bool {
        get { UserDefaults.standard.bool(forKey: "hasAddedTodoItemTestData") }
        set { UserDefaults.standard.set(newValue, forKey: "hasAddedTodoItemTestData") }
    }
    
    // MARK: - Init
    init() {
        setupData()
        addObservers()
    }
}

// MARK: - Public API
extension TodoListViewModel {
    var itemsLeftCount: Int {
        allTodoItems.filter { !$0.status }.count
    }
    
    var todos: [TodoItem] {
        allTodoItems.filter { !$0.status }
    }
    
    var doneTodos: [TodoItem] {
        allTodoItems.filter { $0.status }
    }
    
    func updateTodo(at index: Int) {
        let selectedTodo = todos[index]
        let todoIndex = allTodoItems.firstIndex(of: selectedTodo)!
        allTodoItems[todoIndex].status.toggle()
    }
    
    func updateDoneTodo(at index: Int) {
        let selectedTodo = doneTodos[index]
        let todoIndex = allTodoItems.firstIndex(of: selectedTodo)!
        allTodoItems[todoIndex].status.toggle()
    }
    
    func addTodo(_ todo: String) {
        allTodoItems.append(TodoItem(title: todo, status: false))
    }
}

// MARK: - Helper Methods
extension TodoListViewModel {
    private func setupData() {
        // Check if test data has been added for the first time
        // if not, check core data for any items
        if !self.hasAddedTodoItemTestData {
            allTodoItems = TodoItem.createTestData()
            hasAddedTodoItemTestData = true
            CoreDataManager.shared.saveContext()
        } else {
            CoreDataManager.shared.fetchAllTodoItems { result in
                switch result {
                case .success(let todoItems):
                    self.allTodoItems = todoItems
                case .failure(let error):
                    print("Error Fetching Todo Items: \(error.localizedDescription)")
                }
            }
        }
    }
    
    private func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.willResignActiveNotification, object: nil)
    }
}

// MARK: - Actions
extension TodoListViewModel {
    @objc private func appMovedToBackground() {
        CoreDataManager.shared.saveContext()
    }
}
