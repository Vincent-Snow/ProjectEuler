//
//  main.swift
//  Product Sum Numbers
//
//  Created by Vincent Snow on 1/15/21.
//
/* A natural number, N, that can be written as the sum and product of a given set of at least two natural numbers, {a1, a2, ... , ak} is called a product-sum number: N = a1 + a2 + ... + ak = a1 × a2 × ... × ak.
 
 For example, 6 = 1 + 2 + 3 = 1 × 2 × 3.

 For a given set of size, k, we shall call the smallest N with this property a minimal product-sum number. The minimal product-sum numbers for sets of size, k = 2, 3, 4, 5, and 6 are as follows.

 k=2: 4 = 2 × 2 = 2 + 2
 k=3: 6 = 1 × 2 × 3 = 1 + 2 + 3
 k=4: 8 = 1 × 1 × 2 × 4 = 1 + 1 + 2 + 4
 k=5: 8 = 1 × 1 × 2 × 2 × 2 = 1 + 1 + 2 + 2 + 2
 k=6: 12 = 1 × 1 × 1 × 1 × 2 × 6 = 1 + 1 + 1 + 1 + 2 + 6

 Hence for 2≤k≤6, the sum of all the minimal product-sum numbers is 4+6+8+12 = 30; note that 8 is only counted once in the sum.

 In fact, as the complete set of minimal product-sum numbers for 2≤k≤12 is {4, 6, 8, 12, 15, 16}, the sum is 61.

 What is the sum of all the minimal product-sum numbers for 2≤k≤12000?*/

import Foundation
func primeFactors(_ n: Int) -> Array<Int> {
    var n = n
    var factors = [Int]()
    for divisor in 2 ..< n {
        while n % divisor == 0 {
            factors.append(divisor)
            n /= divisor
        }
    }
    return factors
}
//var tothe(_ x:Int, _ y:Int)

var sumNum: [Int: Int] = [:]
outerloop: for i in 3...20 {
    let primFact = primeFactors(i)
    if primFact == [] {
        continue
    }
    print(i, primFact)
    let sum = primFact.reduce(0, +)
    
    let prod = primFact.reduce(1, *)
    if sum == i && prod == i {
        sumNum[i] = primFact.count
        continue
    }
    for j in 1...i {
        if (j + sum) == i && (1 * prod) == i {
            sumNum[i] = primFact.count + j
            continue outerloop
        }
    }
}

for i in sumNum.sorted(by: {
    if $0.value != $1.value {
        return $0.value < $1.value
    } else {
        return $0.key < $1.key
    }})
{
    print(i)
}
