//
//  main.swift
//  Powerful Digit Sum
//
//  Created by Vincent Snow on 11/12/21.
//
//A googol (10^100) is a massive number: one followed by one-hundred zeros; 100^100 is almost unimaginably large: one followed by two-hundred zeros. Despite their size, the sum of the digits in each number is only 1.

//Considering natural numbers of the form, a^b, where a, b < 100, what is the maximum digital sum?

import Foundation

let start = Date()
func t() -> TimeInterval {
    return Date().timeIntervalSince(start)
}

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

func longMultiply(_ arr:[Int],_ x:[Int]) -> [Int] {
    
    var f: [Int] = []
    iLoop: for i in 0...x.count-1 {
        var prod = singleLongMultiply(arr, x: x[i])
        if x.count-1 != i {
            for _ in 1...x.count - 1 - i {
                prod.append(0)
            }
        }
        f = addArr(f, prod)
    }
    return f
}

//print(longMultiply([1,1,1], x: [9,9,9]))

//print(longMultiply([9,9], [9,9]))

var max: (Int,Int,Int,[Int]) = (0,0,0,[])
for i in 1...99 {
    var n = [i]
    if i > 10 {
        n = [i/10, i % 10]
    }
    var c = n
    for pow in 2...99 {
        c =  longMultiply(c, n)
        //print(c, pow, i)
        let current = c.reduce(0, +)
        if current > max.2 {
            max = (i,pow,current,c)
        }
    }
}
print(max,t())
