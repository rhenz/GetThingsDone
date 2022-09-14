//
//  UIColor+Extension.swift
//  GetThingsDone
//
//  Created by John Salvador on 9/13/22.
//

import UIKit

extension UIColor {
    
    static var blueZero: UIColor { return UIColor.init(hex: 0x64E4FF) }
    static var blueOne: UIColor { return UIColor.init(hex: 0x3A7BD5) }
    
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(
            red: CGFloat(red)/255,
            green: CGFloat(green)/255,
            blue: CGFloat(blue)/255, alpha: 1)
    }
    
    convenience init(hex: Int) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF)
    }
}
