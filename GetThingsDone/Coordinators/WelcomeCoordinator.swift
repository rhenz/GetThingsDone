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
    
    // MARK: - Init
    
    init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: -
    
    func start() {
        let welcomeViewController = WelcomeViewController()
        
        window.rootViewController = welcomeViewController
        window.makeKeyAndVisible()
    }
}
