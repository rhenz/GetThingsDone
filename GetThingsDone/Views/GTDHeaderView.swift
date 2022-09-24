//
//  GTDHeaderView.swift
//  GetThingsDone
//
//  Created by John Salvador on 9/24/22.
//

import UIKit

final class GTDHeaderView: UIView {
    
    // MARK: - Properties
    let gradientView = GTDGradientView()
    
    // MARK: - Init
    init(frame: CGRect = .zero, title: String = "header title", subtitle: String = "header subtitle") {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup UI
extension GTDHeaderView {
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(gradientView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            gradientView.topAnchor.constraint(equalTo: topAnchor),
            gradientView.leadingAnchor.constraint(equalTo: leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: trailingAnchor),
            gradientView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
