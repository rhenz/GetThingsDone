//
//  GTDHeaderView.swift
//  GetThingsDone
//
//  Created by John Salvador on 9/24/22.
//

import UIKit

final class GTDHeaderView: UIView {
    
    // MARK: - Views
    private let gradientView = GTDGradientView()
    private let titleLabel = GTDLabel()
    private let subtitleLabel = GTDLabel()
    
    // MARK: - Properties
    let headerTitle: String
    var subtitle = ""
    
    // MARK: - Init
    init(frame: CGRect = .zero, headerTitle: String) {
        self.headerTitle = headerTitle
        super.init(frame: frame)
        setupView()
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
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = headerTitle
        addSubview(titleLabel)
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.text = subtitle
        subtitleLabel.font = subtitleLabel.font.withSize(Styles.FontSize.largeTitle)
        addSubview(subtitleLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        let padding: CGFloat = 10
        let leftPadding: CGFloat = 20
        
        // Main
        NSLayoutConstraint.activate([
            gradientView.topAnchor.constraint(equalTo: topAnchor),
            gradientView.leadingAnchor.constraint(equalTo: leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: trailingAnchor),
            gradientView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        // Title
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: -4),
            titleLabel.leadingAnchor.constraint(equalTo: subtitleLabel.leadingAnchor)
        ])
        
        // Subtitle
        NSLayoutConstraint.activate([
            subtitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leftPadding),
            subtitleLabel.widthAnchor.constraint(equalToConstant: 250),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}
