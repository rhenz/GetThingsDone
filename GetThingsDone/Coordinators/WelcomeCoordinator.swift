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
    
    // MARK: - Init
    
    init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: -
    
    func start() {
        welcomeViewController = WelcomeViewController()
        welcomeViewController.viewModel = WelcomeViewModel(coordinator: self)
        window.rootViewController = welcomeViewController
        window.makeKeyAndVisible()
    }
    
    func startTodoList() {
        let todoListCoordinator = TodoListCoordinator(welcomeViewController: welcomeViewController)
        todoListCoordinator.start()
    }
}
