//
//  main.swift
//  SubstringDivisibility
//
//  Created by Vincent Snow on 1/9/21.
//
/*The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each of the digits 0 to 9 in some order, but it also has a rather interesting sub-string divisibility property.
 
 Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the following:

 d2d3d4=406 is divisible by 2
 d3d4d5=063 is divisible by 3
 d4d5d6=635 is divisible by 5
 d5d6d7=357 is divisible by 7
 d6d7d8=572 is divisible by 11
 d7d8d9=728 is divisible by 13
 d8d9d10=289 is divisible by 17
 Find the sum of all 0 to 9 pandigital numbers with this property.

*/

//d4 must equal 0,2,4,6,8
// d3 + d4 + d5 % 3 == 0
// d6 must equal 0, 5

import Foundation
import Algorithms

var subStringDivisible = true
var sum = 0

let start = Date()
var perm = [0,1,2,3,4,5,6,7,8,9]
var perm2 = [0,1,2,3]
func substr() {
    for finalPerm in perm.permutations() where finalPerm[0] != 5 {

        let finalFour = [finalPerm[0], finalPerm[1], finalPerm[2], finalPerm[4]]
        if finalFour.sorted() == [1,3,7,9] {
            continue
        }
        switch finalPerm[3] {
        case 0,2,4,6,8:
            subStringDivisible = true
        default:
            continue
        }
        if (finalPerm[2] + finalPerm[3] + finalPerm[4]) % 3 != 0 {
            continue
        }
    
        switch finalPerm[5] {
        case 0, 5:
            subStringDivisible = true
        default:
            continue
        }
    
        if ((finalPerm[7] * 100)+(finalPerm[8] * 10)+(finalPerm[9])) % 17 != 0 {
            continue
        }
        if ((finalPerm[6] * 100)+(finalPerm[7] * 10)+(finalPerm[8])) % 13 != 0 {
            continue
        }
        if ((finalPerm[5] * 100)+(finalPerm[6] * 10)+(finalPerm[7])) % 11 != 0 {
            continue
        }
        if ((finalPerm[4]*100) + (finalPerm[5]*10) + finalPerm[6]) % 7 != 0 {
            continue
        }
        print(finalPerm)
        sum+=finalPerm.reduce(0, {$0*10 + $1})
    }
}
substr()
print(sum, Date().timeIntervalSince(start))
