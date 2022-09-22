//
//  GTDButton.swift
//  GetThingsDone
//
//  Created by John Salvador on 9/22/22.
//

import UIKit

class GTDButton: UIButton {
    
    // MARK: - Properties
    
    private(set) var title: String = "Button"
    
    // MARK: - Init
    
    init(title: String, frame: CGRect = .zero) {
        super.init(frame: frame)
        self.title = title
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup UI

extension GTDButton {
    
    private func setupView() {
        var container = AttributeContainer()
        container.font = UIFont(name: Styles.FontName.ralewayRegular,
                                size: Styles.FontSize.regular)
        
        var configuration = UIButton.Configuration.filled()
        configuration.cornerStyle = .capsule
        configuration.baseBackgroundColor = .white
        configuration.baseForegroundColor = .init(white: 0.6, alpha: 0.5)
        configuration.attributedTitle = AttributedString(title, attributes: container)
        configuration.titleAlignment = .center
        configuration.buttonSize = .large
        
        self.configuration = configuration
    }
}
