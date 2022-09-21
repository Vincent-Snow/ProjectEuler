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
let u = 500000
let sieve = eratosthenesSieve(to: u)
var sieveDict: [Int: Bool] = [:]
for i in sieve {
    sieveDict[i] = true
}
print(sieve.count)
let stri = stride(from: 3, through: u, by: 2)
func primeTest(_ n: Int,_ sieve: [Int]) -> (Int, Int) {
    for i in sieve where i < n/2 {
        
        if n.isMultiple(of: i) {
            return (n, i)
        }
    }
    return (n,1)
}
//for i in stri {
//    let sq = i*i
//    let min = i-1
//    let s3 = sq - (3 * min)
//    print(primeTest(s3, sieve))
//}

var c = 0
var iter = 0

for i in stri {
    let sq = i*i
    let min = i-1
    let s = sq - min
    let s2 = sq - (2 * min)
    let s3 = sq - (3 * min)
    let str = String(i)
    print(i, s3, s2, s, sq, "\n")
    if sieveDict[s3] == true {
        //|| (s3 > u && primeTest(s3, sieve)) {
        c+=1
    }

    if sieveDict[s2] == true {
        //|| (str.last! != "3" && str.last! != "9" && s2 > u && primeTest(s2, sieve)) {
        c+=1
    }
    if sieveDict[s] == true {
        //|| (s > u && primeTest(s, sieve)) {
       c+=1
    }
    iter+=1
    let per = Double(c)/Double((iter*4)+1)
//    if sieveDict[i] == true {
//        print("\n", i, s3, s2, s, sq, "\n")
//    }

    //print("primes: ", c,"    total: ", (iter*4)+1, "    %:", round(per * 10000)/10000)
     //   print(i, s3, s2, s, sq, "\n")
    print(s)
    if per < 0.1 {
        print(i,c,(iter*4)+1, per, t())
        break
    }
}

