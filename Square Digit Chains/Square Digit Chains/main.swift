//
//  main.swift
//  Square Digit Chains
//
//  Created by Vincent Snow on 12/24/20.
//
import Foundation

//var getsTo89: [Int] = []
let start = Date()
var neverGetsTo89: [Int:Bool] = [:]
//var neverGetsTo89: [Int] = []
var sum = 0
var totalLoops = 0
var totalCombsEqual1 = 0
var totalPermsEqual1 = 0
var permsThatReach89: Int
let sevenFact = factorial(7)

// brute force below 567 ( 9^2 * 7 ) creates array of every number that will reach 1 eventually
outerLoop: for i in 1...567 {
    var input = String(i)
    sum = 0
    loop89: while sum != 89 && sum != 1 {
        sum = 0
        for i in input {
            let intI = Int(String(i))!
            sum+=(intI*intI)
        }
        if sum == 1 {
//            neverGetsTo89.append(i)
            neverGetsTo89[i] = true
            continue outerLoop
        }
        input = String(sum)
    }
}

// 7 for loops that will create every combination of different digits < 10,000,000
for x7 in 0...9 {
    for x6 in x7...9 {
        for x5 in x6...9 {
            for x4 in x5...9 {
                for x3 in x4...9 {
                    for x2 in x3...9 {
                        for x1 in x2...9 {
                            let number = [x7,x6,x5,x4,x3,x2,x1]
                            print(number)
                            totalLoops+=1
                            for i in number {
                                sum+=(i*i)
                            }
                            
//                            if neverGetsTo89.contains(sum) {        // check if the sum of the digits squared are in our gets to 1 array
                            if neverGetsTo89[sum] == true {
                                let mappedItems = number.map { ($0, 1) }
                                let counts = Dictionary(mappedItems, uniquingKeysWith: +) // calculate the unique occurences of each digit in number
                                totalCombsEqual1+=1
                                var fact = 1
                                for j in counts {   //
                                    fact*=factorial(j.value)
                                }
                                totalPermsEqual1+=(sevenFact/fact) // 7! / the factorial of the count of each unique digit (0011222 = 2!*2!*3!)
                            }
                            sum = 0
                        }
                    }
                }
            }
        }
    }
}
permsThatReach89 = (10000000 - totalPermsEqual1 - 1) // since we calculated for 1, take the complement
print(totalLoops, totalCombsEqual1, totalPermsEqual1, permsThatReach89, Date().timeIntervalSince(start))



