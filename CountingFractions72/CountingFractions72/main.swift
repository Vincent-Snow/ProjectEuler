//
//  main.swift
//  CountingFractions72
//
//  Created by Vincent Snow on 12/23/21.
//
//Consider the fraction, n/d, where n and d are positive integers. If n<d and HCF(n,d)=1, it is called a reduced proper fraction.
//
//If we list the set of reduced proper fractions for d ≤ 8 in ascending order of size, we get:
//
//1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5, 5/8, 2/3, 5/7, 3/4, 4/5, 5/6, 6/7, 7/8
//
//It can be seen that there are 21 elements in this set.
//
//How many elements would be contained in the set of reduced proper fractions for d ≤ 1,000,000?
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
func reduceFraction(_ x: Int,_ y: Int) -> (Int, Int){
    var d = 0;
    d = gcd(x, y);
    return (x/d,y/d)
}
func gcd(_ a: Int,_ b: Int) -> Int {
    if (b == 0) {
        return a
    }
    return gcd(b, a % b);
}
let u = 1000000
var c = 0
var count = 0
var sieveDict: [Int:Bool] = [:]
var primeFactors: [Int: (Int,[Int])] = [:]
let sieve = eratosthenesSieve(to: u)
for i in sieve {
    sieveDict[i] = true
}

for i in 2...u {
    let arr = sieveDict[i] == true ? [i] : []
    primeFactors[i] = (i-1,arr)
}


for prime in sieve where prime <= u/2 {
    let stri = stride(from: prime, through: u, by: prime)
mstri: for multiple in stri {
        if sieveDict[multiple] == true {
            primeFactors[multiple] = (multiple-1, [prime])
            continue mstri
        }
        var ar = primeFactors[multiple]!.1
        let curr = primeFactors[multiple]!.0
        ar.append(prime)
        primeFactors[multiple] = (curr - (multiple/prime - 1), ar)
    }
}

iLoop: for i in primeFactors {
    let fact = i.value.1
    var adjust = 0
    if fact.count >= 2 {
        for j in 2...fact.count {
            for comb in fact.combinations(ofCount: j) {
                let reduct = comb.reduce(1,*)
                let prod = i.key / reduct - 1
                if comb.count % 2 == 0 {
                    adjust+=prod
                } else {
                    adjust-=prod
                }
            }
        }
    }
    var tmpVal = i.value
    tmpVal.0 += adjust
    primeFactors[i.key] = tmpVal
}
for i in primeFactors {
//    print(i.key,i.value)
    count+=i.value.0
}
print(count,t())

//iLoop: for i in 2...u {
//    if sieveDict[i] == true {
//        c+=i-1
//        continue iLoop
//    }
//    var tmp = 0
//    jLoop: for j in 1..<i {
//        if (j,i) == reduceFraction(j, i) {
//            //print(j,i)
//            tmp+=1
//        }
//    }
//    print("\(i): ", tmp)
//    c+=tmp
//}
//print(c,t())
