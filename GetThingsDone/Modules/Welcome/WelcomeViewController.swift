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
        return label
    }()
    
    private let infoLabel: GTDLabel = {
        let label = GTDLabel(
            title: "WELCOME. GET THINGS DONE IS A TODO LIST. A DOPE TODO LIST!",
            fontSize: Styles.FontSize.regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let copyrightLabel: GTDLabel = {
        let label = GTDLabel(title: "© 2022 | JLCS",
                             color: Styles.Color.copyright,
                             fontSize: Styles.FontSize.small)
        label.textAlignment = .center
        return label
    }()
    
    private(set) lazy var letsGoButton: GTDButton = {
        let button = GTDButton(title: "Let's Go!")
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Properties
    
    var viewModel: WelcomeViewModel!
    
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
        
        // Let's Go Button
        backgroundView.addSubview(letsGoButton)
        
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
        
        // Let's Go Button
        NSLayoutConstraint.activate([
            letsGoButton.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -padding),
            letsGoButton.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor)
        ])
    }
}

// MARK: - Actions

extension WelcomeViewController {
    @objc private func nextButtonTapped(_ sender: GTDButton) {
        // Animate button
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1, options: .curveEaseIn) {
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                sender.transform = .identity
            }
        }
        
        // Present next screen
        viewModel.tappedNextButton()
    }
}
