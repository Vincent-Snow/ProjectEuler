//
//  main.swift
//  PrimeDigitReplacements
//
//  Created by Vincent Snow on 2/1/21.
//
/*By replacing the 1st digit of the 2-digit number *3, it turns out that six of the nine possible values: 13, 23, 43, 53, 73, and 83, are all prime.
 
 By replacing the 3rd and 4th digits of 56**3 with the same digit, this 5-digit number is the first example having seven primes among the ten generated numbers, yielding the family: 56003, 56113, 56333, 56443, 56663, 56773, and 56993. Consequently 56003, being the first member of this family, is the smallest prime with this property.

 Find the smallest prime which, by replacing part of the number (not necessarily adjacent digits) with the same digit, is part of an eight prime value family.*/


import Foundation
import Algorithms

let start = Date()
let upper = 1000000
let sieve = eratosthenesSieve(to: upper)
var sieveDict: [Int:Bool] = [:]
var digMissing: [String:[Int]] = [:]
var prover: [String:Bool] = [:]


for i in sieve {
    sieveDict[i] = true
}
var arr: [[Int]] = []
var three:[[[Int]]] = []

for x in 0...7 {
    var arror: [Int] = []
    for i in 0...x {
        arror.append(i)
    }
    
    var tmp: [[Int]] = []
jLoop: for j in 1...x+1 {
    if j == x+1 {
        break jLoop
    }
        for k in arror.combinations(ofCount: j) {
            tmp.append(k)
        }
    }
    three.append(tmp)
}

for i in sieve where i > 10 {
//    print("\n\n\n")
//    print(i)
    let chars = Array(String(i))
    let c = chars.count
jLoop: for j in three[c-1] {
        var tmp = chars
        var prev = Character("s")
        for ind in j {
            if prev != Character("s") && prev != tmp[ind] {
                continue jLoop
            }
            let s = tmp[ind]
            tmp[ind] = "x"
            prev = s
        }
        let str = String(tmp)
        //print(str)
        if prover[str] == true {
            var ar = digMissing[str]!
            ar.append(i)
            digMissing[str] = ar
        } else {
            prover[str] = true
            digMissing[str] = [i]
        }
    }
}
// .sorted(by: {$0.value.count < $1.value.count })
for i in digMissing where i.value.count > 7 {
//    if i.key == "56xx3" {
        print(i.key, i.value)
//    }
}

print(t())
