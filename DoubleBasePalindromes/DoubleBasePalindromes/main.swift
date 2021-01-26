//
//  main.swift
//  DoubleBasePalindromes
//
//  Created by Vincent Snow on 1/25/21.
//

import Foundation

let start = Date()
//for i in 1...50 {
//    let p = Int(pow(2.0, Double(i)))
//    let s = String(p, radix: 2)
//    print(s,p, i, s.count)
//}
var base: [Int:Bool] = [:]
var sum = 0
for i in 1...1000000 {
    if String(i) == String(String(i).reversed()) {
        base[i] = true
        //print(i)
    }
}
for i in base.keys.sorted() {
    let s = String(i, radix: 2)
    if s == String(s.reversed()) {
        print(s,i)
        sum+=i
    }
}
print(Date().timeIntervalSince(start), sum)
