//
//  main.swift
//  PrimePowerTriplets
//
//  Created by Vincent Snow on 2/1/21.
//
/*The smallest number expressible as the sum of a prime square, prime cube, and prime fourth power is 28. In fact, there are exactly four numbers below fifty that can be expressed in such a way:
 
 28 = 22 + 23 + 24
 33 = 32 + 23 + 24
 49 = 52 + 23 + 24
 47 = 22 + 33 + 24

 How many numbers below fifty million can be expressed as the sum of a prime square, prime cube, and prime fourth power?*/

import Foundation
let start = Date()
let u = 50000000
let usq = Int(sqrt(Double(u)))
let sieve = eratosthenesSieve(to: usq)
var dict: [Int:Bool] = [:]
i: for i in sieve {
    let isq = i*i
    j: for j in sieve {
        let jcube = j*j*j
        if isq+jcube > u {
            continue i
        }
        k: for k in sieve {
            let kfour = k*k*k*k
            if isq+jcube+kfour > u {
                continue j
            }
            let x = (isq) + (jcube) + (kfour)
            if x < u {
                dict[x] = true
            }
        }
    }
}
print(dict.count,t())
