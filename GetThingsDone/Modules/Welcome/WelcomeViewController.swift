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
        let label = GTDLabel(title: "GET IT DONE", fontSize: Styles.FontSize.largeTitle)
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
    }
}
