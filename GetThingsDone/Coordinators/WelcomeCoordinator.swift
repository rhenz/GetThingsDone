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
    private let navigationController: UINavigationController
    
    // MARK: - Init
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: -
    
    func start() {
        let welcomeViewController = WelcomeViewController()
        navigationController.pushViewController(welcomeViewController, animated: false)
    }
}
