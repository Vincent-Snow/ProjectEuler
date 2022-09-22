//
//  main.swift
//  SquareRootConvergents57
//
//  Created by Vincent Snow on 9/22/22.
//

import Foundation

func singleLongMultiply(_ arr: [Int], x: Int) -> [Int] {
    var tempArr:[Int] = []
    let str = stride(from: arr.count-1, through: 0, by: -1)
    var tens = 0
    iLoop: for i in str {
        
        let p = (x*arr[i]) + tens
        if p < 10 {
            tempArr.insert(p, at: 0)
            tens = 0
        } else {
            let ones = p % 10 // 2
            tens = p / 10
            tempArr.insert(ones, at: 0)
            if i == 0 {
                tempArr.insert(tens, at: 0)
            }
        }
    }
    return tempArr
}
func addArr(_ arr1:[Int], _ arr2:[Int]) -> [Int] {
    var sum: [Int] = []
    var arr1 = arr1
    var arr2 = arr2
    while arr1.count > arr2.count {
        arr2.insert(0, at: 0)
    }
    while arr1.count < arr2.count {
        arr1.insert(0, at: 0)
    }
    let str = stride(from: arr1.count-1, through: 0, by: -1)
    var s = 0
    for i in str {
        s = arr1[i] + arr2[i] + s
        if s < 10 {
            sum.insert(s, at: 0)
            s = 0
        } else {
            let r = s % 10
            sum.insert(r, at: 0)
            s = s / 10
            if i == 0 {
                sum.insert(s, at: 0)
            }
        }
    }
    
    return sum
}

var num = [1]
var den = [2]
var c = 0
for i in 1...1000 {
    let prev = den
    den = singleLongMultiply(den, x: 2)
    den = addArr(den, num)
    num = prev
    let realNum = addArr(num, den)
    //print(realNum,den, i)
    if realNum.count > den.count {
        c+=1
    }
}
print(c)

