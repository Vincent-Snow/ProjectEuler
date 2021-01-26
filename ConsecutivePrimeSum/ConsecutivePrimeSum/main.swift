//
//  main.swift
//  ConsecutivePrimeSum
//
//  Created by Vincent Snow on 1/25/21.
//

import Foundation

let start = Date()
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
let useSieve = eratosthenesSieve(to: 3943)
var sieveDict: [Int:Bool] = [:]
for i in sieve {
    sieveDict[i] = true
}

var highest = 0
var longestArr: [Int] = []
var longCounter = 0

jLoop: for j in 0..<useSieve.count {

    var tempsum = 0
    var counter = 0
    for i in 0...600 {
        if useSieve.count-1 > i+j {
            counter+=1
            tempsum+=useSieve[i+j]
        } else {
            continue jLoop
        }
        if sieveDict[tempsum] == true && counter > longCounter {
            highest = tempsum
            longCounter = counter
            print(longCounter, highest)
        }
    }
}
print(Date().timeIntervalSince(start))
