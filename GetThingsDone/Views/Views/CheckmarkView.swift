//
//  CheckmarkView.swift
//  GetThingsDone
//
//  Created by John Salvador on 10/2/22.
//

import UIKit

class CheckmarkView: UIView {
    
    // MARK: - Properties
    private var checkmarkImageView = UIImageView()
    private var isChecked: Bool = false
    
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
        
        checkmarkImageView.translatesAutoresizingMaskIntoConstraints = false
        checkmarkImageView.tintColor = .lightGray
        addSubview(checkmarkImageView)
        NSLayoutConstraint.activate([
            checkmarkImageView.topAnchor.constraint(equalTo: topAnchor),
            checkmarkImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            checkmarkImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            checkmarkImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapCheckmarkView))
        addGestureRecognizer(tapGestureRecognizer)
    }
}

// MARK: - Action
extension CheckmarkView {
    @objc private func tapCheckmarkView(_ recognizer: UITapGestureRecognizer) {
        if isChecked {
            checkmarkImageView.image = nil
            checkmarkImageView.backgroundColor = .white
        } else {
            checkmarkImageView.image = UIImage(systemName: "checkmark")
            checkmarkImageView.backgroundColor = .green
        }
        
        isChecked.toggle()
    }
}
