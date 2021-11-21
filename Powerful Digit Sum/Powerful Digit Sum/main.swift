//
//  main.swift
//  Powerful Digit Sum
//
//  Created by Vincent Snow on 11/12/21.
//
//A googol (10^100) is a massive number: one followed by one-hundred zeros; 100^100 is almost unimaginably large: one followed by two-hundred zeros. Despite their size, the sum of the digits in each number is only 1.

//Considering natural numbers of the form, a^b, where a, b < 100, what is the maximum digital sum?

import Foundation

//let double = 100.0
//let double2 = 100.0
//print(String(format: "%f", pow(double, double2)))

//for i in 2...99 {
//    for j in 2...7 {
//        let pow = pow(Double(i), Double(j))
//
//        var s = String(pow)
//        s.removeLast()
//        s.removeLast()
//        var sum = 0
//        for i in s {
//            sum+=Int(String(i))!
//        }
//        print(i,j,pow,sum)
//    }
//}



//let x = 2
var max = 0
for x in 3...3 {
    var tempArr:[Int] = []
    var arr:[Int] = [x]
    for n in 2...99 {
        let str = stride(from: arr.count-1, through: 0, by: -1)
        var tens = 0
        iLoop: for i in str {
            
            let p = x*arr[i]
            let ones = p % 10 // 2
            if p >= 10 && ones+tens < 10 {
 
                tempArr.insert(ones+tens, at: 0)
                tens = p / 10 // 10
                if i == 0 {
                    tempArr.insert(tens, at: 0)
                }
            } else if p>=10 && ones+tens > 10 {
                
            } else {
                tempArr.insert(p+tens, at: 0)
                tens = 0
            }
        }
        let current = tempArr.reduce(0, +)
        //print(tempArr,"Sum:",current,"pow:",n, "num:", x)
        print(tempArr)
        if current > max {
            max = current
            print("Sum:",max,"pow:",n, "num:", x)
        }
        arr = tempArr
        tempArr = []
    }
}

