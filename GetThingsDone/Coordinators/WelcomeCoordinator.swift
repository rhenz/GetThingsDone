//
//  WelcomeCoordinator.swift
//  GetThingsDone
//
//  Created by John Salvador on 9/7/22.
//

import UIKit

final class WelcomeCoordinator: Coordinator {
    
    // MARK: - Properties
    
    private(set) var childCoordinators: [Coordinator] = []
    private let window: UIWindow
    
    private(set) var welcomeViewController: WelcomeViewController!
    private var welcomeViewHasDisplayedAlready: Bool {
        get { UserDefaults.standard.bool(forKey: "welcomeViewHasDisplayedAlready") }
        set { UserDefaults.standard.set(newValue, forKey: "welcomeViewHasDisplayedAlready") }
    }
    
    // MARK: - Init
    
    init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: -
    
    func start() {
        if welcomeViewHasDisplayedAlready {
            let todoListViewController = TodoListViewController(viewModel: TodoListViewModel())
            window.rootViewController = todoListViewController
            window.makeKeyAndVisible()
        } else {
            welcomeViewController = WelcomeViewController()
            welcomeViewController.viewModel = WelcomeViewModel(coordinator: self)
            window.rootViewController = welcomeViewController
            window.makeKeyAndVisible()
        }
    }
    
    func startTodoList() {
        let todoListCoordinator = TodoListCoordinator(welcomeViewController: welcomeViewController)
        childCoordinators.append(todoListCoordinator)
        todoListCoordinator.parentCoordinator = self
        todoListCoordinator.start()
    }
}
