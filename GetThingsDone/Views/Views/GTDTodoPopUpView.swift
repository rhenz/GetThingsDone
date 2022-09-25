//
//  GTDTodoPopUpView.swift
//  GetThingsDone
//
//  Created by John Salvador on 9/25/22.
//

import UIKit

final class GTDTodoPopUpView: GTDGradientView {
    
    // MARK: - Views
    let cancelButton = GTDButton(title: "cancel", cornerStyle: .medium)
    let addButton = GTDButton(title: "add", cornerStyle: .medium)
    let textfield = UITextField()
    
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
        
        addSubview(cancelButton)
        addSubview(addButton)
        
//        textfield.translatesAutoresizingMaskIntoConstraints = false
//        addSubview(textfield)
    }
    
    private func layout() {
        let leftAndRightPadding: CGFloat = 15
        let topAndBottomPadding: CGFloat = 20
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
    }
}
