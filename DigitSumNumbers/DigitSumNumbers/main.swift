//
//  main.swift
//  DigitSumNumbers
//
//  Created by Vincent Snow on 12/22/20.
//

import Foundation

var sumOfDS = 0
var dsArray: [Int] = []
//for i in 1...9 {
//    sumOfDS+=i
//    dsArray.append(i)
//}
for i in 10...99 {
    if i % 11 == 0 {
        sumOfDS+=i
        dsArray.append(i)
    }
}


print(10^^16)
for i in 100...1000 {
    if i % 101 == 0 && i < 1000 {
        sumOfDS+=i
        dsArray.append(i)
        continue
    }
    var numAsDigitsArray = String(i).map({$0.wholeNumberValue ?? 0})
    print(numAsDigitsArray)
    numAsDigitsArray.sort()
    print(numAsDigitsArray)
    var counter = 0
    if numAsDigitsArray.count >= 3 {
        for x in 0...numAsDigitsArray.count-2 {
            counter+=numAsDigitsArray[x]
        }
        if counter == numAsDigitsArray[numAsDigitsArray.count-1] {
            sumOfDS+=i
            dsArray.append(i)
        }
    }
}
print(sumOfDS, dsArray.count, dsArray)
