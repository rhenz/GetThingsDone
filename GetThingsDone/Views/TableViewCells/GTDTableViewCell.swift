//
//  GTDTableViewCell.swift
//  GetThingsDone
//
//  Created by John Salvador on 10/2/22.
//

import UIKit

class GTDTableViewCell: UITableViewCell {
    
    // MARK: - Views
    var titleLabel = GTDLabel()
    private var todoItemView = UIView()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.style()
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup UI
extension GTDTableViewCell {
    private func style() {
        backgroundColor = .clear
        selectionStyle = .none
        
        todoItemView.translatesAutoresizingMaskIntoConstraints = false
        todoItemView.layer.cornerRadius = 6
        todoItemView.backgroundColor = .white
        contentView.addSubview(todoItemView)
        
        titleLabel.textColor = Styles.Color.todoItemLabel
        todoItemView.addSubview(titleLabel)
    }
    
    private func layout() {
        // TodoItem View
        let topAndBottomPadding: CGFloat = 5
        let leftAndRightPadding: CGFloat = 15
        let todoItemViewHeight: CGFloat = 29
        NSLayoutConstraint.activate([
            todoItemView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: topAndBottomPadding),
            todoItemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: leftAndRightPadding),
            todoItemView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -leftAndRightPadding),
            todoItemView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -topAndBottomPadding),
            todoItemView.heightAnchor.constraint(equalToConstant: todoItemViewHeight)
        ])
        
        // Title Label
        let labelPadding: CGFloat = 5
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: todoItemView.topAnchor, constant: labelPadding),
            titleLabel.leadingAnchor.constraint(equalTo: todoItemView.leadingAnchor, constant: labelPadding),
            titleLabel.trailingAnchor.constraint(equalTo: todoItemView.trailingAnchor, constant: -labelPadding),
            titleLabel.bottomAnchor.constraint(equalTo: todoItemView.bottomAnchor, constant: -labelPadding),
        ])
    }
    
}
