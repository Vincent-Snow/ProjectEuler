//
//  main.swift
//  Champernowe's Constant
//
//  Created by Vincent Snow on 1/7/21.
//

import Foundation
var digitCounter = 1
var index = 0
for i in 1...200000 {
//    if i == 10 || i == 100 || i == 1000 || i == 10000 || i == 100000 || i == 200000 {
//        print(i, index)
//    }
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
    if (10...11).contains(index) || (100...102).contains(index) || (998...1003).contains(index) || (9996...10004).contains(index) || (99995...100005).contains(index) || (999994...1000006).contains(index) {
        print(index, i)
    }
}
