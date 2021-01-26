//
//  main.swift
//  DistinctPrimeFactors
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
    return factors
}

let sieve = eratosthenesSieve(to: 125000)
var sieveDict: [Int:Bool] = [:]
for i in sieve {
    sieveDict[i] = true
}
var consec = 0
var i = 1
while consec < 4 {
 
    var counter = 0
    if sieveDict[i] == true {
        consec = 0; i+=1
        continue
    }
    let fact = factors(i)
    if fact.count < 5 {
        consec = 0; i+=1
        continue
    }
    for j in fact {
        if sieveDict[j] == true {
            counter+=1
        }
    }
    if counter >= 4 {
        consec+=1
    } else {
        consec = 0
    }
    if consec >= 4 {
        print(i, i-1, i-2, i-3)
    }
    i+=1
}
print(Date().timeIntervalSince(start))
