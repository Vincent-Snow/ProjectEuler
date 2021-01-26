//
//  main.swift
//  Non-abundant sums
//
//  Created by Vincent Snow on 1/25/21.
//
/*A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
 
 A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

 As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

 Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

*/

import Foundation

func factors(of n: Int) -> [Int] {
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
        let ap = n / factors[j]
        if ap == n { return factors }
        factors.append(n / factors[j])
        j -= 1
    }
    return factors
}

let start = Date()
var abundant: [Int:Bool] = [:]
var ab: [Int] = []
for i in 1...28123 {
    let fact = factors(of: i)
    let sum = fact.reduce(0, +)

    if sum > i {
        ab.append(i)
    }
}


var abDict: [Int:Bool] = [:]
var sum = 0
let stri = stride(from: 46, to: 28123, by: 2)
for i in stri {
    abDict[i] = true
}
iLoop: for i in ab {
    for j in ab where i % 2 != 0{
        if i+j <= 28123 {
            //print(i,j)
            abDict[i+j] = true
        } else {
            continue iLoop
        }
    }
}
//print(abDict.count, Date().timeIntervalSince(start))
iLoop: for i in 1...28123 {
    if abDict[i] != true {
 //       print(i)
        sum+=i
    }
//    jLoop: for j in ab {
//        for k in ab {
//            if (j+k) > i {
//                continue jLoop
//            }
//            if j > i {
//                continue iLoop
//            }
//            if i == (j+k) {
////                print(i, (j,k))
//                continue iLoop
//            }
//        }
//    }
//    if i % 2 == 0 {
//    //    print(i)
//    }
//    sum+=i
}
print(sum, Date().timeIntervalSince(start))
