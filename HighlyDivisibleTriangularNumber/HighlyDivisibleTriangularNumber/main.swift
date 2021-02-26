//
//  main.swift
//  HighlyDivisibleTriangularNumber
//
//  Created by Vincent Snow on 2/21/21.
//

import Foundation
let start = Date()
func primeFactors(_ n: Int) -> [Int] {
    var n = n
    var factors: [Int] = []

    var divisor = 2
    while divisor * divisor <= n {
        while n % divisor == 0 {
            factors.append(divisor)
            n /= divisor
        }
        divisor += divisor == 2 ? 1 : 2
    }
    if n > 1 {
        factors.append(n)
    }

    return factors
}

func factors(_ n: Int) -> [Int] {
    precondition(n > 0, "n must be positive")
    let sqrtn = Int(Double(n).squareRoot())
    var factors: [Int] = []
    factors.reserveCapacity(2 * sqrtn)
    for i in 1...sqrtn {
        if n % i == 0 {
            factors.append(i)
        }
    }
    var j = factors.count - 1
    if factors[j] * factors[j] == n {
        j -= 1
    }
    while j >= 0 {
        factors.append(n / factors[j])
        j -= 1
    }
    //print(factors)
    return factors
}

var t = 1
var c = 0
for i in 1...1000000 {
    c+=t
    t+=1
    let prifax = primeFactors(c)
    let mappedItems = prifax.map { ($0, 1) }
    let counts = Dictionary(mappedItems, uniquingKeysWith: +)
    var current = 1
    for j in counts.values {
        current*=(j+1)
    }
    if current > 500 {
        print(c,i)
        print(primeFactors(c))
        print(factors(c))
        break
    }
}

print(Date().timeIntervalSince(start))
