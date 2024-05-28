//
//  Int+Extensions.swift
//
//  Created by Evgeny Turchaninov on 28.05.2024.
//

import Foundation

public extension Int {
    var absolute: Int {
        self > 0 ? self : -1 * self
    }
}
