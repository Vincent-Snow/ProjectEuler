//
//  main.swift
//  Powerful Digit Counts
//
//  Created by Vincent Snow on 1/13/21.
//
extension Double {
    func toString() -> String {
        return String(format: "%.1f",self)
    }
}

import Foundation
let start = Date()

func toThe(_ x: Int, _ y: Int) -> String {
    return (pow(Double(x), Double(y))).toString()
}
var powers: [String] = []
for i in 1...30 {
    for j in 1...9 {
        let power = toThe(j, i)
        if power.count-2 == i {
            print(power, j, i)
            powers.append(power)
        }
    }
}
print(powers.count, Date().timeIntervalSince(start))

