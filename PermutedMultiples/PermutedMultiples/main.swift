//
//  main.swift
//  PermutedMultiples
//
//  Created by Vincent Snow on 1/26/21.
//
/*It can be seen that the number, 125874, and its double, 251748, contain exactly the same digits, but in a different order.
 
 Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits.*/

import Foundation

let start = Date()
iLoop: for i in 1...1000000 {
    let s = String(i).sorted()//.map({String($0)})
    for x in 2...6 {
        let sX = String(i*x).sorted()//.map({String($0)})
        if s != sX {
            continue iLoop
        }
    }
    for x in 1...6 {
        print(i*x)
    }
    break
}
print(Date().timeIntervalSince(start))

