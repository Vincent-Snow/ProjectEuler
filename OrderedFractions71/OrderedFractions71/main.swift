//
//  main.swift
//  OrderedFractions71
//
//  Created by Vincent Snow on 12/23/21.
//
//Consider the fraction, n/d, where n and d are positive integers. If n<d and HCF(n,d)=1, it is called a reduced proper fraction.
//
//If we list the set of reduced proper fractions for d ≤ 8 in ascending order of size, we get:
//
//1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5, 5/8, 2/3, 5/7, 3/4, 4/5, 5/6, 6/7, 7/8
//
//It can be seen that 2/5 is the fraction immediately to the left of 3/7.
//
//By listing the set of reduced proper fractions for d ≤ 1,000,000 in ascending order of size, find the numerator of the fraction immediately to the left of 3/7.

import Foundation
let start = Date()
func t() -> TimeInterval {
    return Date().timeIntervalSince(start)
}
func reduceFraction(_ x: Int,_ y: Int) -> (Int, Int){
    var d = 0;
    d = gcd(x, y);
    return (x/d,y/d)
}
func gcd(_ a: Int,_ b: Int) -> Int {
    if (b == 0) {
        return a
    }
    return gcd(b, a % b);
}
let u = 1000000
var fractArr: [(Int,Int)] = [(1,8),(3,7)]
var closest: (Double,Double) = (1.0,8.0)
iLoop: for i in 2...u where i != 7 {
    jLoop: for j in Int(Double(i)*(closest.0/closest.1))..<i {
        if Double(j)/Double(i) > 3.0/7.0 {
            continue iLoop
        }
        if Double(j)/Double(i) > closest.0/closest.1 {
            if reduceFraction(j, i) == (3,7) {
                continue jLoop
            }
            closest = (Double(j),Double(i))
        }
    }
}
print(reduceFraction(Int(closest.0), Int(closest.1)))
print(t())

