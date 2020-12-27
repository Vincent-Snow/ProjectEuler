//
//  main.swift
//  MaximumSumPath
//
//  Created by Vincent Snow on 12/23/20.
//

import Foundation

var testInput = """
3
7 4
2 4 6
8 5 9 3
"""
var highestSumPath = 0
var sumPath = 0
var triang = testInput.components(separatedBy: "\n")
//print(triang)
//1, 1 2, 1 2 3, 1 2 3 4

for i in 0..<triang.count {
    sumPath = 0
    for j in 0..<triang[i].count {
        sumPath+=triang[i][j].wholeNumberValue ?? 0
        print(triang[i][j])
    }
    if sumPath > highestSumPath {
        highestSumPath = sumPath
    }
    
}
print(sumPath, highestSumPath)

