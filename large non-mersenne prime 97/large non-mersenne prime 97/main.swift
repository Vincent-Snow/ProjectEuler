//
//  main.swift
//  large non-mersenne prime 97
//
//  Created by Vincent Snow on 12/11/21.
//
//28433×2^7830457+1
import Foundation
let start = Date()
func t() -> TimeInterval {
    return Date().timeIntervalSince(start)
}
var n = 2
for _ in 2...7830457 {
    if n > 10000000000 {
        n = n % 10000000000
    }
    n = n * 2
}
print((n*28433+1)%10000000000,t())


