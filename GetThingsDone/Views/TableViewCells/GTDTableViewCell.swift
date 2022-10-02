//
//  GTDTableViewCell.swift
//  GetThingsDone
//
//  Created by John Salvador on 10/2/22.
//

import UIKit

class GTDTableViewCell: UITableViewCell {
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.style()
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Views
    var titleLabel = GTDLabel()
}

// MARK: - Setup UI
extension GTDTableViewCell {
    private func style() {
        contentView.layer.cornerRadius = 6
        
        titleLabel.text = "Sample Todo"
        contentView.addSubview(titleLabel)
    }
    
    private func layout() {
        // Title Label
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor)
        ])
    }
    
}
