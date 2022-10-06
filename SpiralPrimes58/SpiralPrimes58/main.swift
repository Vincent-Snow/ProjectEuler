//
//  main.swift
//  SpiralPrimes58
//
//  Created by Vincent Snow on 8/21/22.
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
let u = 200000
let sieve = eratosthenesSieve(to: u)
var sieveDict: [Int: Bool] = [:]
for i in sieve {
    sieveDict[i] = true
}

func compositeTest(_ n: Int) -> Bool {
    for i in sieve where i < Int(sqrt(Double(n))) {
        if n % i == 0 {
            return true
        }
    }
    return false
}

var c = 0
var iter = 0
let stri = stride(from: 3, through: u, by: 2)

for i in stri {
    let sq = i*i
    let min = i-1
    let s = sq - min
    let s2 = sq - (2 * min)
    let s3 = sq - (3 * min)

    if sieveDict[s3] == true || !compositeTest(s3) {
        c+=1
    }
    if sieveDict[s2] == true || !compositeTest(s2){
        c+=1
    }
    if sieveDict[s] == true || !compositeTest(s) {
       c+=1
    }
    
    iter+=1
    let per = Double(c)/Double((iter*4)+1)

    print("primes: ", c,"    total: ", (iter*4)+1, "    %:", round(per * 10000)/10000)
    print(i, s3, s2, s, sq, "\n")
    if per < 0.1 {
        print("the end")
        print(i,c,(iter*4)+1, per, t())
        break
    }
}

