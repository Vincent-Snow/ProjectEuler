//
//  main.swift
//  TruncatablePrimes
//
//  Created by Vincent Snow on 1/19/21.
//

/* The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.
 
 Find the sum of the only eleven primes that are both truncatable from left to right and right to left.

 NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.*/
import Foundation
let start = Date()

func sieveNotIncluding(_ max: Int) -> [Int] {
    guard max > 1 else { return [] }

    var sieve = [Bool](repeating: true, count: max)

    sieve[0] = false
    sieve[1] = false

    for i in 2..<max where sieve[i] == true {
        for j in stride(from: i*i, to: max, by: i) {
            sieve[j] = false
        }
    }

    return sieve.enumerated().compactMap { $1 == true ? $0 : nil }
}
let sieve = sieveNotIncluding(1000000)

var sum = 0
var sieveHash: [Int:Int] = [:]
for i in sieve {
    sieveHash[i] = 1
}

iLoop: for i in sieve {
    var counter = 0
//    var trunc = ""
    var stri = String(i)
    var stri2 = stri
    for _ in 0..<stri.count {
        if sieveHash[Int(stri)!] == 1 {
            counter+=1
            stri.removeLast()
        } else {
            continue iLoop
        }
    }
    for _ in 0..<stri2.count {
        if sieveHash[Int(stri2)!] == 1 {
            counter+=1
            stri2.removeFirst()
        } else {
            continue iLoop
        }
    }
    if counter == String(i).count*2 && String(i).count != 1 {
        print(i)
        sum+=i
    }
}
print(sum, Date().timeIntervalSince(start))
