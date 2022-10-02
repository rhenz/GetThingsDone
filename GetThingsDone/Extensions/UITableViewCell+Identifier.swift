//
//  UITableViewCell+Identifier.swift
//  GetThingsDone
//
//  Created by John Salvador on 10/2/22.
//

import UIKit

extension UITableViewCell {
    static var cellIdentifier: String {
        String(describing: Self.self)
    }
}
