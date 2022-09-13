//
//  WelcomeViewController.swift
//  GetThingsDone
//
//  Created by John Salvador on 9/7/22.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - Views
    
    private var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .cyan
        view.layer.cornerRadius = 6
        return view
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
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        let padding: CGFloat = 40
        
        // Background View
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
        ])
    }
}
