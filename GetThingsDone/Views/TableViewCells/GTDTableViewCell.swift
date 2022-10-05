//
//  GTDTableViewCell.swift
//  GetThingsDone
//
//  Created by John Salvador on 10/2/22.
//

import UIKit

protocol GTDTableViewCellDelegate: AnyObject {
    func gtdTableViewCell(_ tableViewCell: GTDTableViewCell, didTapCheckmarkView checkmarkView: CheckmarkView)
}

class GTDTableViewCell: UITableViewCell {
    
    // MARK: - Views
    var titleLabel = GTDLabel()
    private var todoItemView = UIView()
    private var checkmarkView = CheckmarkView()
    
    // MARK: - Properties
    weak var delegate: GTDTableViewCellDelegate?
    
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
        
        checkmarkView.didTap = { [weak self] in
            guard let self = self else { return }
            self.delegate?.gtdTableViewCell(self, didTapCheckmarkView: self.checkmarkView)
        }
        todoItemView.addSubview(checkmarkView)
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
            titleLabel.trailingAnchor.constraint(equalTo: checkmarkView.leadingAnchor, constant: -labelPadding),
            titleLabel.bottomAnchor.constraint(equalTo: todoItemView.bottomAnchor, constant: -labelPadding),
        ])
        
        // Checkmark View
        let checkmarkPadding: CGFloat = 5
        checkmarkView.setContentHuggingPriority(.required, for: .horizontal)
        checkmarkView.setContentCompressionResistancePriority(.required, for: .horizontal)
        NSLayoutConstraint.activate([
            checkmarkView.rightAnchor.constraint(equalTo: todoItemView.rightAnchor, constant: -checkmarkPadding),
            checkmarkView.centerYAnchor.constraint(equalTo: todoItemView.centerYAnchor)
        ])
    }
    
}

// MARK: - Public Method
extension GTDTableViewCell {
    func configure(withTodoItem todoItem: TodoItem) {
        titleLabel.text = todoItem.title
        checkmarkView.setCheck(todoItem.status)
    }
}
