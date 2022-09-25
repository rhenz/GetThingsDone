//
//  GTDTextField.swift
//  GetThingsDone
//
//  Created by John Salvador on 9/25/22.
//

import UIKit

final class GTDTextField: UITextField {
    
    // MARK: - Init
    init(frame: CGRect = .zero, placeholderTitle: String = "") {
        super.init(frame: frame)
        self.placeholder = placeholderTitle
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 10)
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}

// MARK: - Setup UI

extension GTDTextField {
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        borderStyle = .roundedRect
        font = UIFont(name: Styles.FontName.ralewayRegular, size: Styles.FontSize.regular)
        
    }
}
