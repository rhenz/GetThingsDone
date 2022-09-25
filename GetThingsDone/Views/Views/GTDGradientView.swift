//
//  GTDGradientView.swift
//  GetThingsDone
//
//  Created by John Salvador on 9/13/22.
//

import UIKit

class GTDGradientView: UIView {
    
    // MARK: - Properties
    
    private var colors: [CGColor] = [
        UIColor.blueZero.cgColor,
        UIColor.blueOne.cgColor
    ]
    
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

// MARK: - Setup UI

extension GTDGradientView {
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let layer = self.layer as? CAGradientLayer {
            layer.colors = colors
            layer.locations = [0.0, 1.2]
        }
    }
}
