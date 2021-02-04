//
//  main.swift
//  PrimeDigitReplacements
//
//  Created by Vincent Snow on 2/1/21.
//
/*By replacing the 1st digit of the 2-digit number *3, it turns out that six of the nine possible values: 13, 23, 43, 53, 73, and 83, are all prime.
 
 By replacing the 3rd and 4th digits of 56**3 with the same digit, this 5-digit number is the first example having seven primes among the ten generated numbers, yielding the family: 56003, 56113, 56333, 56443, 56663, 56773, and 56993. Consequently 56003, being the first member of this family, is the smallest prime with this property.

 Find the smallest prime which, by replacing part of the number (not necessarily adjacent digits) with the same digit, is part of an eight prime value family.*/


// 1 2 3
// 1 2 3 0 - X
// 1 2 0 3
// 1 0 2 3
// 1 2 3 4
// 1 2 3 0 4
// 1 2 0 3 4
// 1 0 2 3 4
// 1 2 3 0 0 - X
// 1 2 0 0 3
// 1 0 0 2 3
// 1 0 2 0 3
// 101 103 107 109, 111,113,117,119, 201, 203, 207,209

import Foundation

let start = Date()
let upper = 1000000
let sieve = eratosthenesSieve(to: upper+1)
var sieveDict: [Int:Bool] = [:]
var primArr: [Int] = []
var p: [Character] = ["1","3","7","9"]
let stri = stride(from: 101, to: upper+1, by: 2)
for i in sieve where i > 100 {
    sieveDict[i] = true
}
//for i in stri where i % 5 != 0 {
//    let m = i % 10
//    let x = (i/10)*100
//    let v = m + x
//    print(v)
//}
var highest = 0
var hNum = 0
func oneDig(_ upper: Int) {
    var inc = 10
    let len = String(upper).count-2
    for _ in 1...len {
        for i in stri where i % 5 != 0 {
            var counter = 1
            let m = i % inc
            let x = (i/inc)*(inc*10)
            let v = m + x
//            print(v)
            for j in 1...9 {
                let check = v+(j*inc*10)
                if sieveDict[check] == true {
                    print(check)
                    counter+=1
                }
            }
            if counter > highest {
                highest = counter
                hNum = v
                print("highest", highest, hNum)
            }
        }
        inc*=10
    }
}
oneDig(upper)
print("highest",highest,hNum)


var counter = 0
for i in sieve where i > 10000 {
    if String(i)[2] == String(i)[3] {
        primArr.append(i)
    }
}

//for i in primArr {
//    for j in 1...99 {
//        for k in p {
//            if i/1000 == j && String(i).last! == k {
//                print((j,i))
//            }
//        }
//    }
//}
print(t())
