//
//  main.swift
//  DoubleBasePalindromes
//
//  Created by Vincent Snow on 1/25/21.
//

import Foundation

let start = Date()
var base: [Int:Bool] = [:]
var sum = 0
for i in 1...1000000 {
    if String(i) == String(String(i).reversed()) {
        base[i] = true
    }
}
for i in base.keys.sorted() {
    let s = String(i, radix: 2)
    if s == String(s.reversed()) {
        print(s,i)
        sum+=i
    }
}
print(Date().timeIntervalSince(start), sum)
