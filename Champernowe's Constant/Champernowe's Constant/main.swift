//
//  main.swift
//  Champernowe's Constant
//
//  Created by Vincent Snow on 1/7/21.
//

import Foundation
var digitCounter = 1
var index = 0
var prod = 1
let start = Date()
for i in 1...200000 {
    let strCo = String(i).count
    if strCo == digitCounter {
        index+=digitCounter
    } else if strCo == digitCounter+1 {
        digitCounter+=1
        index+=digitCounter
    } else {
        print("something went wrong")
        break
    }
    if (10...11).contains(index) || (100...102).contains(index) || (1000...1003).contains(index) || (10000...10004).contains(index) || (100000...100005).contains(index) || (1000000...1000006).contains(index) {
        let lastInd = Int(String(String(index).last!))!
        let stri = String(i)
        prod*=Int(String(stri[stri.count-lastInd-1]))!
        print(index, i, prod)
    }
}
print(Date().timeIntervalSince(start))
