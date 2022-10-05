//
//  TodoSectionTitleView.swift
//  GetThingsDone
//
//  Created by John Salvador on 10/5/22.
//

import UIKit

class TodoSectionTitleView: UIView {
    
    // MARK: - Properties
    let title: String
    private var titleLabel: GTDLabel!
    
    // MARK: - Init
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup UI
extension TodoSectionTitleView {
    private func style() {
        titleLabel = GTDLabel(title: title, fontSize: 20)
        addSubview(titleLabel)
    }
    
    private func layout() {
        let leftPadding: CGFloat = 15
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leftPadding),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
