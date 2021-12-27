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
let u = 5000
var c = 0
var sieveDict: [Int:Bool] = [:]
for i in eratosthenesSieve(to: u) {
    sieveDict[i] = true
}
iLoop: for i in 2...u {
    if sieveDict[i] == true {
        c+=i-1
        continue iLoop
    }
    jLoop: for j in 1..<i {
        if (j,i) == reduceFraction(j, i) {
            c+=1
        }
    }
}
print(c,t())

