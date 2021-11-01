//
//  main.swift
//  Quadratic Primes
//
//  Created by Vincent Snow on 1/25/21.
//

import Foundation
let start = Date()
func t() -> TimeInterval {
    return Date().timeIntervalSince(start)
}

func eratosthenesSieve(to n: Int) -> [Int] {
    var composite = Array(repeating: false, count: n + 1) // The sieve
    var primes: [Int] = []

    if n >= 150 {
        let d = Double(n)
        let upperBound = Int(d / (log(d) - 4))
        primes.reserveCapacity(upperBound)
    } else {
        primes.reserveCapacity(n)
    }

    let squareRootN = Int(Double(n).squareRoot())
    var p = 2
    while p <= squareRootN {
        if !composite[p] {
            primes.append(p)
            for q in stride(from: p * p, through: n, by: p) {
                composite[q] = true
            }
        }
        p += 1
    }
    while p <= n {
        if !composite[p] {
            primes.append(p)
        }
        p += 1
    }
    return primes
}

let sieve = eratosthenesSieve(to: 1000000)
var sieveDict: [Int: Bool] = [:]
for i in sieve {
    sieveDict[i] = true
}
var highest = 0
var bigA = 0
var bigB = 0
var highestProd = 0

bLoop: for b in sieve where b < 1000 {
    aLoop: for a in 1...1000 {
        nLoop: for n in 0...79 {
            let prime = (n*n) - (a * n) + b
            if (n*n) + b <= (a * n) {
                continue bLoop
            }
            if sieveDict[prime] != true {
                continue aLoop
            }
            if n > highest {
                highest = n
                highestProd = a * b
                bigA = a
                bigB = b
            }
        }
        nLoop: for n in 0...79 {
            let prime = (n*n) + (a * n) + b
            if sieveDict[prime] != true {
                continue aLoop
            }
            
            if n > highest {
                highest = n
                highestProd = a * b
                bigA = a
                bigB = b
            }
        }
    }
}

print(highest, highestProd, bigA, bigB)
print(t())
