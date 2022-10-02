//
//  GTDTableView.swift
//  GetThingsDone
//
//  Created by John Salvador on 10/1/22.
//

import UIKit

class GTDTableView: UITableView {
    
    // MARK: - Init
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup UI
extension GTDTableView {
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        separatorStyle = .none
    }
}
