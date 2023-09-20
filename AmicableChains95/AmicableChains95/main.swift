//
//  main.swift
//  AmicableChains95
//
//  Created by Vincent Snow on 11/9/22.
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
func f(_ n: Int) -> [Int] {
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
    while j >= 1 {
        factors.append(n / factors[j])
        j -= 1
    }
    //print(factors)
    return factors
}
func check(_ n:Int,_ chain: [Int]) {
    var chain = chain
    var div: [Int] = []
    if divs[n] == nil {
         div = f(n)
    } else {
        div = divs[n]!
    }
    
    let red = div.reduce(0, +)
    if notInChain[red] != true && red < u {
        if chain.contains(n) {
     //       if chain.count != 0 && chain[0] == n {
                print(chain)
                for i in chain {
                    notInChain[i] = true
                }
                return
     //       }
        }
        chain.append(n)
        check(red, chain)

    } else {
        notInChain[n] = true
    }
}
let u = 1000000
let sieve = eratosthenesSieve(to: u)
var sieveDict: [Int:Bool] = [:]
var notInChain: [Int:Bool] = [:]
var divs: [Int:[Int]] = [:]
var pot: [(Int,Int)] = []
for i in sieve {
    sieveDict[i] = true
}
notInChain = sieveDict
notInChain[1] = true
iLoop: for i in 1...u {

    var chain: [Int] = []
    if notInChain[i] == true {
        continue iLoop
    }
    let div = f(i)
    let red = div.reduce(0, +)
    if i == 284 {
        
    }
    if red == i || notInChain[red] == true {
        notInChain[i] = true
        continue iLoop
    }
    check(i, chain)
//    print(i,div,red)
//    pot.append((i,red))
}

//iLoop: for i in pot {
//    if sieveDict[i.1] == true || notInChain[i.1] == true {
//        notInChain[i.0] = true
//        continue iLoop
//    }
//    print(i)
//}



//for i in 1...1000000 {
//    if sieveDict[i] == true {
//        //print(i,1)
//        div[i] = [1]
//    } else {
//        div[i] = f(i)
//        //print(i,f(i))
//    }
//}

print(t())

