//
//  main.swift
//  AmicableNumbers
//
//  Created by Vincent Snow on 1/3/21.
//
/*
 Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
 If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.

 For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

 Evaluate the sum of all the amicable numbers under 10000.
 */

import Foundation

var amicNums: [Int: Set<Int>] = [:]
var amicArray: Set<Int> = []
var amicPairs: [(Int, Int)] = []
var truePairs: [(Int,Int)] = []
var sum = 0
var outOf = 10000
func contains(a:[(Int, Int)], v:(Int,Int)) -> Bool {
  let (_, c2) = v
  for (_, v2) in a { if v2 == c2 { return true } }
  return false
}
func generatePrimes(to n: Int) -> [Int] {

    precondition(n > 5, "Input must be greater than 5")

    var arr : [Int] = Array<Int>(stride(from: 3, to: n, by: 2))

    for index in 0... {
        let num : Int = arr.remove(at: index)
        arr = arr.filter{ $0 % num != 0 }
        arr.insert(num, at: index)
        if arr[index + 1] >= Int(floor(sqrtf(Float(n)))) { break }
    }

    arr.insert(2, at: 0)

    //Print Statements
//    print("Prime numbers under \(n):")
    _ = arr.enumerated().map { (index, element) in print("\t\(index + 1). \(element)") }

    return arr
}
var primes = generatePrimes(to: outOf)
//var test: [Int] = []
//for i in 1...200 {
//    test.append(i)
//}
//print(test.reduce(0,+))
for i in 1...outOf {
    amicArray = []
    for j in 1...Int(sqrt(Double(i))) {
        if i % j == 0 {
            amicArray.insert(j)
            if i/j < i {
                amicArray.insert(i/j)
            }
        }
    }
    if amicArray.count > 2 {
        amicNums[i] = amicArray
    }
}
//
//for i in amicNums.sorted(by: {$0.key < $1.key }) {
//    if i.value.count > 10  && i.value.reduce(0,+) <= outOf {
//        print(i.key, i.value.sorted(), i.value.reduce(0,+))
//    }
//}
print("done")

for i in amicNums {
    let amicSum = i.value.reduce(0,+)
    if amicSum <= outOf && i.key != amicSum /*&& i.key < amicSum*/ && primes.contains(amicSum) == false/*&& contains(a: amicPairs, v: (0, amicSum)) == false*/ {
        let amicPair = (i.key, amicSum)
        amicPairs.append(amicPair)
    }
}

print(amicPairs.count)
//for i in amicPairs.sorted(by: {$0.1 < $1.1 }) {
////    if i.0 < i.1 {
//        print(i)
////    }
//}
print("\n\n\n\n\n\n")
outerLoop: for i in amicPairs {
    for j in amicPairs {
        if i.0 == j.1 && i.1 == j.0 {
            truePairs.append(i)
            continue outerLoop
        }
    }
}

for i in truePairs.sorted(by: {$0.0 < $1.0}) {
    print(i, i.0 - i.1)
    sum+=i.0
}
print(sum)
