//
//  main.swift
//  AlmostEquilateralTriangles94
//
//  Created by Vincent Snow on 7/10/22.
//

import Foundation
let start = Date()
func t() -> TimeInterval {
    return Date().timeIntervalSince(start)
}
func lawOfCosines(_ a: Double, _ b: Double,_ c:Double) -> Double {
    let gamma = acos(((a*a) + (b*b) - (c*c)) / (2*a*b))
    return gamma
}
func heron(_ a: Double, _ b: Double,_ c:Double) -> Double {
    let s = 0.5 * (a + b + c)
    let root = s * (s-a) * (s-b) * (s-c)
    let A = sqrt(root)
    return A
}
func oblique(_ a: Double, _ b:Double, _ c:Double) -> Double {
    let gamma = lawOfCosines(a, b, c)
    let A = 0.5 * a * b * sin(gamma)
    return A
}
func isInteger(_ dbl:Double) -> Bool {
    let isInteger = floor(dbl) == dbl
    return isInteger
}

var sum = 0.0
//let stri = stride(from: 2.0, to: 100, by: 1.0)
let stri = stride(from: 3.0, to: 10000000, by: 2.0)
//let gamma = lawOfCosines(5.0, 5.0, 6.0)
//let A = 0.5 * 5.0 * 5.0 * sin(gamma)
//
//print(A, gamma * (180.0 / .pi), sin(gamma))
for i in stri {
        let plus = oblique(i, i, i+1.0)
        let minus = oblique(i, i, i-1.0)
        if isInteger(minus) {
            print(minus, i, i-1,"\n")
            sum+=(i+i+i-1.0)
        }
        if isInteger(plus) {
            print(plus,i,i+1,"\n")
            sum+=(i+i+i+1.0)
        }
}

//for i in stri {
//    let alpha = lawOfCosines(i, i, )
//}
//for i in stri {
//
//    let plus = heron(i, i, i+1.0)
//    let minus = heron(i, i, i-1.0)
//    var s = 0.0
//    var root = 0.0
//    if isInteger(minus) {
//
//        s = 0.5 * (i+i+(i-1.0))
//        print("s: ", s)
//        root = s * (s-i) * (s-i) * (s-(i-1.0))
//        print("root: ",root)
//        print(minus, i, i-1,"\n")
//
//    }
//    if isInteger(plus) {
//
//        s = 0.5 * (i+i+i+1.0)
//        print("s: ", s)
//        root = s * (s-i) * (s-i) * (s-(i+1.0))
//        print("root: ",root)
//        print(plus,i,i+1,"\n")
//    }
//
//}
print(t(), sum)


