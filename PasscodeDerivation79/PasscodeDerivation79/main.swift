//
//  main.swift
//  PasscodeDerivation79
//
//  Created by Vincent Snow on 7/30/22.
//

import Foundation

let testInput = """
319
680
180
690
129
620
"""
// 319 3 is before 1 is before 9

// 80 is after 1
// 9 is after 6 and before 0
// 3 1 6 2 9 8 0
var sol: [Int] = []
let line = input.split(separator: "\n")

for i in line {
    for char in i {
        let int = Int(String(char))!
        if !sol.contains(int) {
            sol.append(int)
        }
    }
}
print(sol)


