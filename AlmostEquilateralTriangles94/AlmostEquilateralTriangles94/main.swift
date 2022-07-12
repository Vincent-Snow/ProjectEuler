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
func gcdRecursiveEuklid(_ m: Int, _ n: Int) -> Int {
    let r: Int = m % n
    if r != 0 {
        return gcdRecursiveEuklid(n, r)
    } else {
        return n
    }
}

let u = 20000
var sum = 0
var m = 1
mLoop: while m < u {
    var counter = 0
    let stri = stride(from: m+1, to: u+1, by: 2)
    for n in stri {
        if m*m > 100000000 {
            break mLoop
        }
        if gcdRecursiveEuklid(m, n) == 1 {
            let a = n*n-m*m
            let b = 2*m*n
            let c = m*m+n*n
            if 2*a == c+1 {
                counter+=1
                sum+=c+c+a+a
                print(a,b,c)
            } else if 2*a == c-1 {
                counter+=1
                sum+=c+c+a+a
                print(a,b,c)
            } else if 2*b == c+1 {
                counter+=1
                sum+=c+c+b+b
                print(a,b,c)
            } else if 2*b == c-1 {
                counter+=1
                sum+=c+c+b+b
                print(a,b,c)
            }
            if counter == 2 {
                m = n
                continue mLoop
            }
        }
    }
    break
}
print(t(), sum)
