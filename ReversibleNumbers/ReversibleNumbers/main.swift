//
//  main.swift
//  ReversibleNumbers
//
//  Created by Vincent Snow on 1/3/21.
//


import Foundation
var reversible: [Int] = []
for i in 1...1000000 {
    var sumOdd = false
    let reverse = String(String(i).reversed())
    let intReverse = Int(reverse)!
    let sum = i + intReverse
//    print(i, reverse, sum)
    oddSum: for j in String(sum) {
        if Int(String(j))! % 2 == 0 {
            sumOdd = false
            break oddSum
        } else {
            sumOdd = true
        }
    }
    if sumOdd && String(i).count == String(intReverse).count {
        reversible.append(i)
    }
}

for i in reversible {
    print(i)
}
print(reversible.count)
