//
//  main.swift
//  DistinctPowers
//
//  Created by Vincent Snow on 1/3/21.
//

import Foundation

var a = 2
var b = 100
var dist: Set<Double> = []

print(9^^9)
for i in a...b {
    for j in a...b {
        dist.insert(pow(Double(i), Double(j)))
    }
}

//for i in dist.sorted() {
//    print(i)
//}

print(dist.count)
