//
//  AppCoordinator.swift
//  GetThingsDone
//
//  Created by John Salvador on 9/7/22.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get }
    
    func start()
}

final class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    
    private(set) var childCoordinators: [Coordinator] = []
    private let window: UIWindow
    
    // MARK: - Init
    
    init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: -
    
    func start() {
        let welcomeCoordinator = WelcomeCoordinator(window: window)
        childCoordinators.append(welcomeCoordinator)
        
        welcomeCoordinator.start()
    }
}
