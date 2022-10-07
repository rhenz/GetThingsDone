//
//  TodoListCoordinator.swift
//  GetThingsDone
//
//  Created by John Salvador on 9/23/22.
//

import UIKit

final class TodoListCoordinator: Coordinator {
    
    // MARK: -
    private(set) var childCoordinators: [Coordinator] = []
    private weak var welcomeViewController: WelcomeViewController?
    
    // MARK: - Init
    init(welcomeViewController: WelcomeViewController) {
        self.welcomeViewController = welcomeViewController
    }
    
    // MARK: -
    func start() {
        let todoListViewController = TodoListViewController(viewModel: TodoListViewModel())
        todoListViewController.modalPresentationStyle = .fullScreen
        welcomeViewController?.present(todoListViewController, animated: true)
    }
}
