//
//  GTDLabel.swift
//  GetThingsDone
//
//  Created by John Salvador on 9/19/22.
//

import UIKit

class GTDLabel: UILabel {
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String, color: UIColor = .white, fontSize: CGFloat = Styles.FontSize.regular) {
        self.init(frame: .zero)
        
        text = title
        textColor = color
        font = UIFont(
            name: Styles.FontName.ralewayMedium,
            size: fontSize)
    }
}

// MARK: - Helper Methods

extension GTDLabel {
    private func commonInit() {
        textColor = .white
        font = UIFont(
            name: Styles.FontName.ralewayMedium,
            size: Styles.FontSize.regular)
    }
}
