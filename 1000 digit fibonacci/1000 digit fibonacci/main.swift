//
//  main.swift
//  1000 digit fibonacci
//
//  Created by Vincent Snow on 12/29/20.
//
//my guess is that the number is between 4004 and 5003
import Foundation

let start = Date()
func t() -> TimeInterval {
    return Date().timeIntervalSince(start)
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

var cur = [1]
var prev = [1]
var temp = [1]
var ind = 2

while cur.count < 1000 {
    prev = temp
    temp = cur
    cur = addArr(cur, prev)
    ind+=1

}
print(cur,ind)
print(t())
