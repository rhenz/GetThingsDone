//
//  GTDTodoPopUpView.swift
//  GetThingsDone
//
//  Created by John Salvador on 9/25/22.
//

import UIKit

protocol GTDTodoPopUpViewDelegate: AnyObject {
    func gtdTodoPopUpView(_ gtdTodoPopUpView: GTDTodoPopUpView, didTapAddButton addButton: UIButton)
    func gtdTodoPopUpView(_ gtdTodoPopUpView: GTDTodoPopUpView, didTapCancelButton addButton: UIButton)
}

final class GTDTodoPopUpView: GTDGradientView {
    
    // MARK: - Views
    let cancelButton = GTDButton(title: "cancel", cornerStyle: .medium)
    let addButton = GTDButton(title: "add", cornerStyle: .medium)
    let textField = GTDTextField(placeholderTitle: "Add new todo item")
    
    // MARK: - Properties
    weak var delegate: GTDTodoPopUpViewDelegate?
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: bounds.width, height: 130)
    }
}

// MARK: - Setup UI
extension GTDTodoPopUpView {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        clipsToBounds = true
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        addSubview(cancelButton)
        addSubview(addButton)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
    }
    
    private func layout() {
        let leftAndRightPadding: CGFloat = 15
        let topAndBottomPadding: CGFloat = 20
        let padding: CGFloat = 10
        let buttonHeight: CGFloat = 25
        
        // Cancel Button
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: topAnchor, constant: topAndBottomPadding),
            cancelButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leftAndRightPadding),
            cancelButton.heightAnchor.constraint(equalToConstant: buttonHeight)
        ])
        
        // Add Button
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: topAnchor, constant: topAndBottomPadding),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -leftAndRightPadding),
            addButton.heightAnchor.constraint(equalToConstant: buttonHeight)
        ])
        
        // Text Field
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: padding),
            textField.leadingAnchor.constraint(equalTo: cancelButton.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: addButton.trailingAnchor)
        ])
    }
}

// MARK: - Actions
extension GTDTodoPopUpView {
    @objc private func cancelButtonTapped(_ sender: UIButton) {
        // Empty the textfield
        textField.text = ""
        
        delegate?.gtdTodoPopUpView(self, didTapCancelButton: sender)
    }
    
    @objc private func addButtonTapped(_ sender: UIButton) {
        delegate?.gtdTodoPopUpView(self, didTapAddButton: sender)
    }
}
