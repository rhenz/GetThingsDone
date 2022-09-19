//
//  GTDLabel.swift
//  GetThingsDone
//
//  Created by John Salvador on 9/19/22.
//

import UIKit

class GTDLabel: UILabel {
    
    // MARK: - Types
    enum FontWeight {
        case regular
        case medium
        case bold
        
        var fontName: String {
            switch self {
            case .regular:
                return Styles.FontName.ralewayRegular
            case .medium:
                return Styles.FontName.ralewayMedium
            case .bold:
                return Styles.FontName.ralewayBold
            }
        }
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(
        title: String,
        color: UIColor = .white,
        fontWeight: FontWeight = .regular,
        fontSize: CGFloat = Styles.FontSize.regular)
    {
        self.init(frame: .zero)
        
        text = title
        textColor = color
        
        font = UIFont(
            name: fontWeight.fontName,
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
