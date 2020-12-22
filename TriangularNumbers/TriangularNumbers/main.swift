//
//  main.swift
//  TriangularNumbers
//
//  Created by Vincent Snow on 12/21/20.
//

import Foundation


var x = 0
var triangNum = 0
var highestNum = 0
var highestCount = 0
var divisors: Set<Int> = []
var mostDivisors = divisors

for i in 1...15000 {
    divisors = []
    x+=i
   
    if x % 2 == 0 && x % 3 == 0  && x % 5 == 0 {
        for j in 1...Int(sqrt(Double(x))) {
            if x % j == 0 {
                divisors.insert(j)
                divisors.insert(x/j)
            }
        }
    
    } else {
        continue
    }
    if divisors.count > highestCount {
        highestCount = divisors.count
        highestNum = x
        triangNum = i
        mostDivisors = divisors
        print(i, x, divisors.count, divisors.sorted(), sqrt(Double(x)))
    }
    if divisors.count >= 500 {
        print("over 500", highestNum, triangNum, highestCount, mostDivisors.sorted())
        break
    }
}

