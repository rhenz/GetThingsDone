//
//  GTDGradientView.swift
//  GetThingsDone
//
//  Created by John Salvador on 9/13/22.
//

import UIKit

final class GTDGradientView: UIView {
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
}

// MARK: -

extension GTDGradientView {
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let layer = self.layer as? CAGradientLayer {
            layer.colors = [UIColor.blue.cgColor, UIColor.gray.cgColor]
            layer.locations = [0.0, 1.2]
        }
    }
}
