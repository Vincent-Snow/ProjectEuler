//
//  main.swift
//  DigitFifthPowers
//
//  Created by Vincent Snow on 1/3/21.
//
/* Problem 30
 Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

 1634 = 14 + 64 + 34 + 44
 8208 = 84 + 24 + 04 + 84
 9474 = 94 + 44 + 74 + 44
 As 1 = 14 is not a sum it is not included.

 The sum of these numbers is 1634 + 8208 + 9474 = 19316.

 Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.*/

import Foundation
let toThe = 5
var sum = 0
var total = 0

for i in 2...5000000 {
    let iStr = String(i)
    sum = 0
    for j in iStr {
        let jInt = Int(String(j))!
        sum += jInt^^toThe
    }
    if sum == i {
        print(i)
        total+=sum
    }
}
print(total)
