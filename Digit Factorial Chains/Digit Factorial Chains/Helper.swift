//
//  Helper.swift
//  Digit Factorial Chains
//
//  Created by Vincent Snow on 2/10/21.
//

import Foundation

extension BinaryInteger {
    var digits: [Int] {
        return String(describing: self).compactMap { Int(String($0)) }
    }
}
