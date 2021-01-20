//
//  main.swift
//  PandigitalProducts
//
//  Created by Vincent Snow on 1/19/21.
//
/* We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.
 
 The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.

 Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.

 HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.*/

import Foundation
import Algorithms

let start = Date()
var pandigitalProducts: Set<Int> = []
let nums = [1,2,3,4,5,6,7,8,9]
var tempNums: [Int] = []
for i in 1...2000 {
    for j in 1...2000 {
        if String(i).count + String(j).count + String(i*j).count == 9 {
            tempNums = []
            for k in String(i) {
                tempNums.append(Int(String(k))!)
            }
            for k in String(j) {
                tempNums.append(Int(String(k))!)
            }
            for k in String(j*i) {
                tempNums.append(Int(String(k))!)
            }
            if tempNums.sorted() == nums {
                pandigitalProducts.insert(i*j)
                print(i,j,i*j)
            }
        }
    }
}
print(Date().timeIntervalSince(start), pandigitalProducts.reduce(0, +))
