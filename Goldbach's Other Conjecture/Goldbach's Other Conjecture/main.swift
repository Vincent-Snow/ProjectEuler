//
//  main.swift
//  Goldbach's Other Conjecture
//
//  Created by Vincent Snow on 1/25/21.
//
/*
 It was proposed by Christian Goldbach that every odd composite number can be written as the sum of a prime and twice a square.

 9 = 7 + 2×12
 15 = 7 + 2×22
 21 = 3 + 2×32
 25 = 7 + 2×32
 27 = 19 + 2×22
 33 = 31 + 2×12

 It turns out that the conjecture was false.

 What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?
 */

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

let sieve = eratosthenesSieve(to: 10000)
var sieveDict: [Int:Bool] = [:]

for i in sieve {
    sieveDict[i] = true
}

var gold: [Int:Bool] = [:]
for i in 1...1000 {
    for j in sieve {
        let num = j + (2*(i*i))
        gold[num] = true
    }
}

let stri = stride(from: 3, to: 10000, by: 2)
iLoop: for i in stri where sieveDict[i] != true {
    if gold[i] != true {
        print(i)
        break iLoop
    }
}
print(Date().timeIntervalSince(start))
