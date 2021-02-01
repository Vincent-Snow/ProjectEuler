//
//  main.swift
//  ReciprocalCycles
//
//  Created by Vincent Snow on 1/6/21.
//

import Foundation

//for i in stride(from: 2.0, to: 1001.0, by: 1) {
//    print(i, (1.0/i)*1000000000000000000000.0)
//}
for i in 1...1000 {
    //let x = 10000000000000000000000000000000000000000000000000000000000000000.0
    let x = 1.0
    print(((1.0*x)/(Double(i))).toString())
}
//var longest = 0
//for i in 1...1000 {
//    if String(1.0/Double(i)).count > longest &&
//    print(String1.0/Double(i))
//}
