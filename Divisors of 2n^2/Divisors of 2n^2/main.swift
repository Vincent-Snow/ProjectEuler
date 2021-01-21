//
//  main.swift
//  Divisors of 2n^2
//
//  Created by Vincent Snow on 1/20/21.
//
/*Let  be the number of divisors of
 that are no greater than n. For example,  because there are 8 such divisors: 1,2,3,5,6,9,10,15. Note that 18 is also a divisor of
 but it is not counted because it is greater than 15.

Let
 
. You are given , and .

Find .*/
import Foundation
let start = Date()

var counterTotal = 0
for n in 1...1000 {
    var indCounter = 0
    let twoNsq = 2*(n*n)
    print(twoNsq, n)
    for j in 1...n {
        if twoNsq % j == 0 {
            counterTotal+=1
            indCounter+=1
        }
    }
    if n == 1000000000 {
        print(Date().timeIntervalSince(start))
    }
//    print(indCounter)
}
print(counterTotal, Date().timeIntervalSince(start))
