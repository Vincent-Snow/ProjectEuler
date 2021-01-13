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

//var arr7: [Int] = []
//for i in 1...142 {
//    arr7.append(i*7)
//}
//
//var arr11: [Int] = []
//for i in 1...90 {
//    arr11.append(i*11)
//    //print(i*11)
//}
//
//var arr17: [Int] = []
//for i in 1...158 {
//    arr17.append(i*17)
////    print(i*17)
//}
//var arr13: [Int] = []
//for i in 1...76 {
//    arr13.append(i*13)
//    //print(i*13)
//}

//let nums = [0,1,2,3,4,5,6,7,8,9]
var subStringDivisible = true
var sum = 0
var counter = 0

//let stri = stride(from: 1234567017, to: 9876543210, by: 1)
//for i in stri where String(i).contains("0") && String(i).contains("1") && String(i).contains("2") && String(i).contains("3") && String(i).contains("4") && String(i).contains("5") && String(i).contains("6") && String(i).contains("7") && String(i).contains("8") && String(i).contains("9") {
//
//    subStringDivisible = true
//    let iArr = String(i).map({Int(String($0))!})
//
//    if !arr17.contains((iArr[7] * 100)+(iArr[8] * 10)+(iArr[9])) {
//        continue
//    }
//    if !arr13.contains((iArr[6] * 100)+(iArr[7] * 10)+(iArr[8])) {
//        continue
//    }
//    if !arr11.contains((iArr[5] * 100)+(iArr[6] * 10)+(iArr[7])) {
//        continue
//    }
//    if (((iArr[4]*10) + iArr[5]) - (2 * iArr[6])) % 7 != 0 {
//        continue
//    }
//
//    switch iArr[5] {
//    case 0:
//        subStringDivisible = true
//    case 5:
//        if iArr[3] != 0 {
//            continue
//        }
//    default:
//        continue
//    }
//
//    if (iArr[2] + iArr[3] + iArr[4]) % 3 != 0 {
//        continue
//    }
//
//    switch iArr[3] {
//    case 0,2,4,6,8:
//        subStringDivisible = true
//    default:
//        continue
//    }
//
//
//
//
//
//    if subStringDivisible {
//        print(i)
//        sum+=i
//        counter+=1
//    }
//}
//
//print(sum, counter)


func factorial(a: Int) -> Int {
    let n = a
    if(n == 1){
      return 1
    }else{
        return n*factorial(a:n-1)
    }
}
let start = Date()
var factDict2: [Int:Int] = [:]
var factCount: [Int:Int] = [:]
var perm = [0,1,2,3,4,5,6,7,8,9]
var perm2 = [0,1,2]
var finalPerm: [Int] = []
//var index = 2
var eye = 2


for i in 1...perm.count {
    factDict2[i] = factorial(a: i)
}
var factDict = factDict2
//for i in 2...3265920 {
//    if i % 2 == 0 {
//
//    }
//}
print(Date().timeIntervalSince(start))
func substr() {
//    for i in 2...3265920 {
        //var perm = [1,2,3,4,5,6,7,8,9,0]
        finalPerm = []
        factCount = [:]
        factDict = factDict2
        var index = 1
            while index > 0 {
                let max = factDict.keys.max()!
                if index - factDict[max]! < 0 {
                    factCount[max-1] = 0
                    let dictIndex = factDict.index(forKey: max)
                    factDict.remove(at: dictIndex!)
                } else {
                    index-=factDict[max]!
                    factCount[max]!+=1
                }
            }

            for i in 0...perm.count-1 {
                if factCount[i] == nil {
                    factCount[i] = 0
                }
            }
            for i in factCount.sorted(by: {$0.key > $1.key}) {
                finalPerm.append(perm[i.value])
                perm.remove(at: i.value)
            }
        perm = finalPerm
        counter+=1
        if eye < 3269520 {
            eye+=1
            substr()
        }
    return
    //    let finalFour = [finalPerm[0], finalPerm[1], finalPerm[2], finalPerm[4]]
    //    if finalFour.sorted() == [1,3,7,9] {
    //        continue
    //    }
    //    switch finalPerm[3] {
    //    case 0,2,4,6,8:
    //        subStringDivisible = true
    //    default:
    //        continue
    //    }
    //    if (finalPerm[2] + finalPerm[3] + finalPerm[4]) % 3 != 0 {
    //        continue
    //    }
    //
    //    switch finalPerm[5] {
    //    case 0, 5:
    //        subStringDivisible = true
    //    default:
    //        continue
    //    }
    //
    //    if ((finalPerm[7] * 100)+(finalPerm[8] * 10)+(finalPerm[9])) % 17 != 0 {
    //        continue
    //    }
    //
    //    if ((finalPerm[6] * 100)+(finalPerm[7] * 10)+(finalPerm[8])) % 13 != 0 {
    //        continue
    //    }
    //    if ((finalPerm[5] * 100)+(finalPerm[6] * 10)+(finalPerm[7])) % 11 != 0 {
    //        continue
    //    }
    ////
    ////    if !arr17.contains((finalPerm[7] * 100)+(finalPerm[8] * 10)+(finalPerm[9])) {
    ////        continue
    ////    }
    ////    if !arr13.contains((finalPerm[6] * 100)+(finalPerm[7] * 10)+(finalPerm[8])) {
    ////        continue
    ////    }
    ////    print("past thirteen", finalPerm)
    ////    if !arr11.contains((finalPerm[5] * 100)+(finalPerm[6] * 10)+(finalPerm[7])) {
    ////        continue
    ////    }
    //    if ((finalPerm[4]*100) + (finalPerm[5]*10) + finalPerm[6]) % 7 != 0 {
    //        continue
    //    }
    //
    //       print(finalPerm)
            //sum+=i

//    }
}
substr()
print(counter, Date().timeIntervalSince(start))
