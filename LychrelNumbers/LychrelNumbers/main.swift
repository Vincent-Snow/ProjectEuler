//
//  main.swift
//  LychrelNumbers
//
//  Created by Vincent Snow on 1/26/21.
//

import Foundation
let start = Date()

func rev(_ x:Double,_ counter: Int) -> (Double,Int) {
    if counter > 50 {
        return (0,counter)
    }
    let xrev = Double(String(x.toString().reversed()))!
    let sum = x + xrev
    if sum == Double(String(sum.toString().reversed()))! {
        return (sum, counter)
    } else {
        return rev(sum,counter+1)
    }
}

var count = 0
for i in 10...10000 {
    let lych = rev(Double(i),1)
    print(i, lych.0.toString(), lych.1 )
    if lych.0 == 0 {
        count+=1
    }
}
print(Date().timeIntervalSince(start), count)
