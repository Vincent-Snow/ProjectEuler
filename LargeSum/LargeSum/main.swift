//
//  main.swift
//  LargeSum
//
//  Created by Vincent Snow on 12/21/20.
//
import Foundation

var firstThirteenArray: [Double] = []
let largeArray = input.components(separatedBy: "\n")

for i in largeArray {
    let firstThirteen = String(i.prefix(13))
    firstThirteenArray.append(Double(firstThirteen) ?? 0)
}

print(firstThirteenArray.reduce(0, +))
