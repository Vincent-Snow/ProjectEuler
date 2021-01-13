//
//  main.swift
//  Triangular, pentagonal, hexagonal
//
//  Created by Vincent Snow on 1/13/21.
//

import Foundation

let start = Date()

var pentDict: [Int:Int] = [:]
for i in 1...100000 {
    let pent = (i * ((3 * i) - 1)) / 2
    pentDict[pent] = 1
}

var triDict: [Int:Int] = [:]
for i in 1...100000 {
    let tri = (i * (i + 1)) / 2
    triDict[tri] = 1
}

var hexDict: [Int:Int] = [:]
for i in 1...100000 {
    let hex = i * ((2 * i) - 1)
    hexDict[hex] = 1
}

for i in triDict.keys.sorted(by:{ $0 < $1 }) {
    if pentDict[i] == 1 && hexDict[i] == 1 {
        print(i)
    }
}

print(Date().timeIntervalSince(start))
