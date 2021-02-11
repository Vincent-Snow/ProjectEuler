//
//  main.swift
//  Digit Factorial Chains
//
//  Created by Vincent Snow on 2/10/21.
//
/*The number 145 is well known for the property that the sum of the factorial of its digits is equal to 145:
 
 1! + 4! + 5! = 1 + 24 + 120 = 145

 Perhaps less well known is 169, in that it produces the longest chain of numbers that link back to 169; it turns out that there are only three such loops that exist:

 169 → 363601 → 1454 → 169
 871 → 45361 → 871
 872 → 45362 → 872

 It is not difficult to prove that EVERY starting number will eventually get stuck in a loop. For example,

 69 → 363600 → 1454 → 169 → 363601 (→ 1454)
 78 → 45360 → 871 → 45361 (→ 871)
 540 → 145 (→ 145)

 Starting with 69 produces a chain of five non-repeating terms, but the longest non-repeating chain with a starting number below one million is sixty terms.

 How many chains, with a starting number below one million, contain exactly sixty non-repeating terms?*/
import Foundation
import Algorithms

func factorial(_ n:Int) -> Int {
    var x = 1
    if n == 0 {
        return 1
    }
    for i in 1...n {
        x*=i
    }
    return x
}
var factorialDict: [Int:Int] = [:]
for i in 0...9 {
    factorialDict[i] = factorial(i)
}
for i in factorialDict {
    print(i)
}
var max = 0
var c = 0
var p = [[2,2,3,4,7,9],[1,4,7,9],[0,7,4,9]]
//for i in p {
//    //print(i)
//    for j in i.permutations() {
//        print(j)
//    }
//}
var cDict: [Int:Bool] = [:]
for i in p.reversed() {
    for perm in i.permutations() {
//for i in 1...1000000 {
        var sumDict: [Int:Bool] = [:]
        let num = perm.reduce(0, {$0*10 + $1})
        var x = num
        var sum = 0
        while sumDict[x] != true {
            sumDict[x] = true
            sum = 0
            for j in x.digits {
                sum+=factorialDict[j]!
            }
            x = sum
        }
        if sumDict.count >= 60  {
            cDict[num] = true
//           print(num,sumDict.count)//, sumDict.keys.sorted())
            //max = sumDict.count
//            c+=1
        }
    }
}
print(cDict.count)

