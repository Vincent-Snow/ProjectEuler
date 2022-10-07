//
//  main.swift
//  TotientMaximum69
//
//  Created by Vincent Snow on 10/6/22.
//

import Foundation
import Algorithms

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
let u = 1000000
let sieve = eratosthenesSieve(to: u)
func gcd(_ m: Int, _ n: Int) -> Int {
    let r: Int = m % n
    if r != 0 {
        return gcd(n, r)
    } else {
        return n
    }
}
func totCheck(_ n: Int) -> Int {
    var phi = 0
    for i in 1...n {
        if gcd(n,i) == 1 {
            phi+=1
        }
    }
    return phi
}

var phiDict: [Int:Int] = [:]
var phiBool: [Int:Bool] = [:]
var sieveDict: [Int:Bool] = [:]
var primeFactors: [Int: [Int]] = [:]
let root = Int(sqrt(Double(u)))


for i in sieve {
    sieveDict[i] = true
}
for i in 2...u {
    let arr = sieveDict[i] == true ? [i] : []
    primeFactors[i] = arr
}

for prime in sieve where prime <= u/2 {
    let stri = stride(from: prime, through: u, by: prime)
mstri: for multiple in stri {
        if sieveDict[multiple] == true {
            primeFactors[multiple] = [prime]
            continue mstri
        }
        var ar = primeFactors[multiple]!
        ar.append(prime)
        primeFactors[multiple] = ar
    }
}
var highest = 0.0
for i in primeFactors.sorted(by: { $0.key < $1.key }) where i.value.count > 6 {
    var high = 0.0
    let phi = totCheck(i.key)
    high = Double(i.key)/Double(phi)
    print(i.key,phi, high)
}
//for pri in sieve where pri < root {
//    var i = pri
//    var prev = 1
//    while i < u {
//        //print(i,totCheck(i))
//        //print(i,i-prev)
//        print(i*3, totCheck(i*3))
//        prev = i
//        i*=pri
//    }
//}
/*
for i in 3...root {
    phiDict[i] = totCheck(i)
}
for i in phiDict.keys.combinations(ofCount: 2) {
    let priProd = i[0]*i[1]
    phiDict[priProd] = phiDict[i[0]]!*phiDict[i[1]]!
}


for i in sieve where i != 2 && i < root {
    phiDict[i]=i-1
    phiDict[i*i]=(i*i)-i
    phiDict[i*2]=i-1
}
phiDict[4] = 2


for i in phiDict.keys.combinations(ofCount: 2) where i[0] < root && i[1] < root {
    let priProd = i[0]*i[1]
    if priProd <= u {
        phiDict[priProd] = phiDict[i[0]]!*phiDict[i[1]]!
    }
}
 */
for i in sieve where i > root {
    phiDict[i]=i-1
    if i < u/2 {
        phiDict[i*2]=i-1
    }
}

for i in phiDict.keys {
    phiBool[i] = true
}

//for i in phiDict.sorted(by: {$0.key<$1.key}) {
//    print(i.key,i.value)
//}

var c = 0
for i in 1...u {
    if phiBool[i] != true {
        c+=1
    }
}
print(c, t())
//for i in 1...100000 {
//    print(i, totCheck(i))
//}
