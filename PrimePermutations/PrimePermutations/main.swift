//
//  main.swift
//  PrimePermutations
//
//  Created by Vincent Snow on 1/20/21.
//

import Foundation
let start = Date()
func sieveNotIncluding(_ max: Int) -> [Int] {
    guard max > 1 else { return [] }

    var sieve = [Bool](repeating: true, count: max)

    sieve[0] = false
    sieve[1] = false

    for i in 2..<max where sieve[i] == true {
        for j in stride(from: i*i, to: max, by: i) {
            sieve[j] = false
        }
    }

    return sieve.enumerated().compactMap { $1 == true ? $0 : nil }
}
var sieve: [Int:Bool] = [:]
for i in sieveNotIncluding(10000) where i > 1000 {
    sieve[i] = true
}
print(sieve.count)
for i in sieve.sorted(by: {$0.key < $1.key}) {
    if sieve[i.key+3330] == true && sieve[i.key+3330+3330] == true {
        if String(i.key).sorted() == String(i.key+3330).sorted() && String(i.key).sorted() == String(i.key+3330+3330).sorted() {
            print(i.key, i.key+3330,i.key+6660)
        }
    }
}
print(Date().timeIntervalSince(start))
