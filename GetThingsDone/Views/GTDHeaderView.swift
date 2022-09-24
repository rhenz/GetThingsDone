//
//  GTDHeaderView.swift
//  GetThingsDone
//
//  Created by John Salvador on 9/24/22.
//

import UIKit

final class GTDHeaderView: UIView {
    
    // MARK: - Init
    init(frame: CGRect = .zero, title: String = "header title", subtitle: String = "header subtitle") {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
