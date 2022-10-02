//
//  CheckmarkView.swift
//  GetThingsDone
//
//  Created by John Salvador on 10/2/22.
//

import UIKit

class CheckmarkView: UIView {
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 25, height: 25)
    }
}

// MARK: - Setup UI
extension CheckmarkView {
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1
    }
}
