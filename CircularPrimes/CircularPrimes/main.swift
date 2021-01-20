//
//  main.swift
//  CircularPrimes
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

let sieve = sieveNotIncluding(1000000)
var sieveHash: [Int:Bool] = [:]
var circular: [Int] = []

for i in sieve {
    sieveHash[i] = true
}

iLoop: for i in sieve {
    var stri = String(i)
    if stri.count == 1 {
        circular.append(i)
        continue iLoop
    }
    for _ in 0..<stri.count {
        stri.insert(stri.removeLast(), at: stri.firstIndex(of: stri.first!)!)
        if sieveHash[Int(stri)!] != true {
            continue iLoop
        }
    }
    circular.append(i)
}
for i in circular {
    print(i)
}
print(circular.count, Date().timeIntervalSince(start))
