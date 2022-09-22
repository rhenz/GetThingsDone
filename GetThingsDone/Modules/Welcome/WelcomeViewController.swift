//
//  WelcomeViewController.swift
//  GetThingsDone
//
//  Created by John Salvador on 9/7/22.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - Views
    
    private var backgroundView: GTDGradientView = {
        let view = GTDGradientView()
        view.layer.cornerRadius = 6
        return view
    }()
    
    private let titleLabel: GTDLabel = {
        let label = GTDLabel(
            title: "GET IT DONE",
            fontWeight: .bold,
            fontSize: Styles.FontSize.largeTitle)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let infoLabel: GTDLabel = {
        let label = GTDLabel(
            title: "WELCOME. GET THINGS DONE IS A TODO LIST. A DOPE TODO LIST!",
            fontSize: Styles.FontSize.regular)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let copyrightLabel: GTDLabel = {
        let label = GTDLabel(title: "© 2022 | JLCS",
                             color: Styles.Color.copyright,
                             fontSize: Styles.FontSize.small)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

// MARK: - Setup UI

extension WelcomeViewController {
    private func setupViews() {
        // View Controller's View
        view.backgroundColor = .white
        
        // Background View
        view.addSubview(backgroundView)
        
        // Title Label
        backgroundView.addSubview(titleLabel)
        
        // Info Label
        backgroundView.addSubview(infoLabel)
        
        // Copyright Label
        view.addSubview(copyrightLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        let padding: CGFloat = 20
        
        // Background View
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            backgroundView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
        ])
        
        // Title Label
        let titleLabelTopPadding: CGFloat = 20
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: titleLabelTopPadding),
            titleLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor)
        ])
        
        // Info Label
        NSLayoutConstraint.activate([
            infoLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            infoLabel.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
            infoLabel.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        // Copyright Label
        NSLayoutConstraint.activate([
            copyrightLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            copyrightLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
