//
//  main.swift
//  PandigitalPrimes
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

let sieve = sieveNotIncluding(7654322)
print(Date().timeIntervalSince(start))
var current = 0
var arr: [Int] = []
for i in sieve where i > 1234567 {
    let stri = String(i)
    if arr.count != stri.count {
        arr = []
        for n in 1...stri.count {
            arr.append(n)
        }
    }
    var striArr: [Int] = []
    for j in stri {
        striArr.append(Int(String(j))!)
    }
    if striArr.sorted() == arr {
        print(i)
        current = i
    }
}
print(current, sieve.count, Date().timeIntervalSince(start))
