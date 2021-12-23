//
//  main.swift
//  Cubic Permutations
//
//  Created by Vincent Snow on 2/10/21.
//
/*The cube, 41063625 (3453), can be permuted to produce two other cubes: 56623104 (3843) and 66430125 (4053). In fact, 41063625 is the smallest cube which has exactly three permutations of its digits which are also cube.
 
 Find the smallest cube for which exactly five permutations of its digits are cube.*/

import Foundation

let start = Date()
func t() -> TimeInterval {
    return Date().timeIntervalSince(start)
}
var cubes: [Int] = []
var cubePerm: [[String]:[Int]] = [:]

for i in 5...10000 {
    let cu = Int(pow(Double(i), 3.0))
    cubes.append(cu)
}
iCube: for i in cubes {
    let str = String(i)
    let strSort = str.sorted().map({String($0)})
     if cubePerm[strSort] != nil {
        cubePerm[strSort]!.append(i)
    } else {
        cubePerm[strSort] = [i]
    }
    if let count = cubePerm[strSort]?.count {
        if count == 5 {
            print(cubePerm[strSort]!, cubePerm[strSort]![0], t())
            break iCube
        }
    }
}
