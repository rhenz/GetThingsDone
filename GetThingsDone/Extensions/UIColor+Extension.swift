//
//  UIColor+Extension.swift
//  GetThingsDone
//
//  Created by John Salvador on 9/13/22.
//

import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(
            red: CGFloat(red)/255,
            green: CGFloat(green)/255,
            blue: CGFloat(blue)/255, alpha: 1)
    }
}
