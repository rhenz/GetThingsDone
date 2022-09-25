//
//  TodoListViewController.swift
//  GetThingsDone
//
//  Created by John Salvador on 9/7/22.
//

import UIKit

class TodoListViewController: UIViewController {
    
    // MARK: - Views
    
    private let header = GTDHeaderView(headerTitle: "Stuff to get done")

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

// MARK: - Setup UI

extension TodoListViewController {
    private func setupViews() {
        view.backgroundColor = .white
        
        header.datasource = self
        view.addSubview(header)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        let headerHeight: CGFloat = 120
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            header.heightAnchor.constraint(equalToConstant: headerHeight)
        ])
    }
}

// MARK: - GTDHeader Datasource
extension TodoListViewController: GTDHeaderViewDatasource {
    func gtdHeaderView(_ gtdHeaderView: GTDHeaderView, subtitleForLabel label: GTDLabel) -> String {
        return "1 left"
    }
}
