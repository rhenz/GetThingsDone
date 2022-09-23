//
//  WelcomeViewModel.swift
//  GetThingsDone
//
//  Created by John Salvador on 9/23/22.
//

import Foundation

final class WelcomeViewModel {
    
    // MARK: - Properties
    private let coordinator: WelcomeCoordinator
    
    // MARK: - Init
    init(coordinator: WelcomeCoordinator) {
        self.coordinator = coordinator
    }
    
    // MARK: - Methods
    func tappedNextButton() {
        coordinator.startTodoList()
    }
}
