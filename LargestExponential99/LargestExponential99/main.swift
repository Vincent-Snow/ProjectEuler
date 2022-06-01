//
//  main.swift
//  LargestExponential99
//
//  Created by Vincent Snow on 5/31/22.
//

import Foundation

print("Hello, World!")

var highest: Double = 0
var index = 0
let strInput = input.split(separator: "\n")
var tuple: [(Int,Int)] = []
for i in strInput {
    let temp = i.split(separator: ",")
    tuple.append((Int(temp[0])!,Int(temp[1])!))
}
for ind in 0..<tuple.count {
    let i = tuple[ind]
    let n = log(Double(i.0)) * Double(i.1)
    if n > highest {
        highest = n
        index = ind+1
        print(i,index,highest)
    }
}

