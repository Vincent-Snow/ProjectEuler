//
//  main.swift
//  Quadratic Primes
//
//  Created by Vincent Snow on 1/25/21.
//

import Foundation

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
var sieveDict: [Int: Bool] = [:]
for i in sieve {
    sieveDict[i] = true
}
var previous = -1
var counter = 0
var highest = 0
var a = 0
var b = 0
var highestProd = 0
//while a < 1000 && b <= 1000 {
//
//    for n in 0...100 {
//        let q = (n*n)+(a*n)+b
//        if sieveDict[q] == true {
//            //print(n, q)
//            counter+=1
//            if n-previous == 1 {
//                previous = n
//            } else {
//                previous = 0
//                counter = 0
//            }
//        }
//        if counter > highest {
//            highest = counter
//            highestProd = a*b
//            print(highest,highestProd,a,b)
//        }
//    }
//    if b == 1000 {
//        a+=1
//        b=0
//    } else {
//        b+=1
//    }
//}
a = -999; b = -1000
while a < 1000 && b <= 1000 {
    
    for n in 0...1000 {
        let q = (n*n)+(a*n)+b
        if sieveDict[q] == true {
            //print(n, q)
            counter+=1
            if n-previous == 1 {
                previous = n
            } else {
                previous = 0
                counter = 0
            }
        }
        if counter > highest {
            highest = counter
            highestProd = a*b
            print(highest,highestProd,n, (a,b))
        }
    }
    if b == 1000 {
        a+=1
        b = -1000
    } else {
        b+=1
    }
//    print(a,b)
}
//a = 0; b = 0
//while a < 1000 && b <= 1000 {
//
//    for n in 0...100 {
//        let q = (n*n)-(a*n)+b
//        if sieveDict[q] == true {
//            //print(n, q)
//            counter+=1
//            if n-previous == 1 {
//                previous = n
//            } else {
//                previous = 0
//                counter = 0
//            }
//        }
//        if counter > highest {
//            highest = counter
//            highestProd = a*b
//        }
//    }
//    if b == 1000 {
//        a+=1
//        b=0
//    } else {
//        b+=1
//    }
//}
//a = 0; b = 0
//while a < 1000 && b <= 1000 {
//
//    for n in 0...100 {
//        let q = (n*n)-(a*n)-b
//        if sieveDict[q] == true {
//            //print(n, q)
//            counter+=1
//            if n-previous == 1 {
//                previous = n
//            } else {
//                previous = 0
//                counter = 0
//            }
//        }
//        if counter > highest {
//            highest = counter
//            highestProd = a*b
//        }
//    }
//    if b == 1000 {
//        a+=1
//        b=0
//    } else {
//        b+=1
//    }
//}
print(highest, highestProd)
