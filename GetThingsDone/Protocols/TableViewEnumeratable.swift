//
//  TableViewEnumeratable.swift
//  GetThingsDone
//
//  Created by John Salvador on 10/5/22.
//

import Foundation

protocol TableViewEnumeratable { }

extension TableViewEnumeratable where Self: RawRepresentable, RawValue == Int {
    static func get(_ index: Int) -> Self {
        guard let section = Self(rawValue: index) else {
            fatalError("\(String(describing: Self.self)) is not equal to sections added on the Storyboard")
        }
        return section
    }
}
