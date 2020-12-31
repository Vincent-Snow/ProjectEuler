//
//  main.swift
//  Smallest multiple
//
//  Created by Vincent Snow on 12/30/20.
//

import Foundation

//var x = 2520
var primeArray = [2,3,5,7,11,13,17,19]
var counter = 0
var highest = 0
var primeOccurences: [Int:Int] = [:]

func add6(x:Int) -> Int {
    return x + 6
}
//print(add6(x: 8))

func primefinder(i: Int) {
    for j in primeArray {
        if j > i {
            return
        } else if i % j == 0 {
            if primeOccurences[j] == nil {
                
            }
        }
    }

}

func primeFactorsOf(number: Int) -> [Int] {
    if number < 4 {
        return [number]
    }
    let lim = Int(sqrt(Double(number)))
    for x in 2...lim {
        if number % x == 0 {
            var result = [x]
            result.append(contentsOf: primeFactorsOf(number: number / x))
            return result
        }
    }
    return [number]
}

var primeFacts: [[Int]] = []
outerLoop: for i in 1...20 {
    primeFacts.append(primeFactorsOf(number: i))
}
for i in primeFacts {
    print(i)
}

for i in primeFacts {
    for j in i {
        highest = 0
        counter = 0
        for k in primeArray {
            if j == k {
                counter+=1
            }
        }
        if highest < counter {
            highest = counter
            primeOccurences[j] = highest
        }
    }
}
print(primeOccurences)

//outerLoop: for i in 1...10000000 {
//
//    for j in 1...20 {
//        if i % j != 0 {
//            continue outerLoop
//        }
//    }
//    print(i)
//}
