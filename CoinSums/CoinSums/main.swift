//
//  main.swift
//  CoinSums
//
//  Created by Vincent Snow on 3/9/21.
//
/*In the United Kingdom the currency is made up of pound (£) and pence (p). There are eight coins in general circulation:
 
 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p), and £2 (200p).
 It is possible to make £2 in the following way:

 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
 How many different ways can £2 be made using any number of coins?*/

import Foundation
import Algorithms

let start = Date()
func t() -> TimeInterval {
    return Date().timeIntervalSince(start)
}

let one = 1
let two = 2
let five = 5
let ten = 10
let twenty = 20
let fifty = 50
let pound = 100
let twoPound: Int  = 200
var oneArr:[Int] = []
var twoArr:[Int] = []
var fiveArr:[Int] = []
var tenArr:[Int] = []
var twentyArr:[Int] = []
var fiftyArr:[Int] = []
var poundArr:[Int] = []
var twoPoundArr:[Int] = []
var up = 200

func pop(up: Int, num: Int) -> [Int] {
    var arr: [Int] = []
    //let stri = stride(from: up/num, through: 0, by: -1)
    let stri = stride(from: 0, through: up/num, by: 1)
    for i in stri {
        arr.append(i*num)
    }
    return arr
}
//func pop(up: Int, num: Int) -> [Int] {
//    var arr: [Int] = []
//    for i in 1...up/num {
//        arr.append(num)
//    }
//    return arr
//}
oneArr = pop(up: up, num: one)
twoArr = pop(up: up, num: two)
fiveArr = pop(up: up, num: five)
tenArr = pop(up: up, num: ten)
twentyArr = pop(up: up, num: twenty)
fiftyArr = pop(up: up, num: fifty)
poundArr = pop(up: up, num: pound)
twoPoundArr = pop(up: up, num: twoPound)

var count = 0
aLoop: for a in twoPoundArr {
    bLoop: for b in poundArr {
        if (a + b) > up {
            continue aLoop
        }
        cLoop: for c in fiftyArr {

            if (a + b + c) > up {
                continue bLoop
            }
            dLoop: for d in twentyArr {
                if (a + b + c + d) > up {
                    continue cLoop
                }
                iLoop: for i in tenArr {

                    if (a + b + c + d + i) > up {
                        continue dLoop
                    }
                    jLoop: for j in fiveArr {
                        if (a + b + c + d + i + j) > up {
                            continue iLoop
                        }
                        kLoop: for k in twoArr {

                            if (a + b + c + d + i + j + k) > up {
                                continue jLoop
                            }
                            lLoop: for l in oneArr {
                                if (a + b + c + d + i + j + k + l) > up {
                                    continue kLoop
                                }
                                
                                if (a + b + c + d + i + j + k + l) == up {
                                    print("200: ",a,"100:   ",b,"50:    ",c,"20:  ", d,"10:  ", i, "5:   ", j, "2:   ", k, "1:   ", l)
                                    count+=1
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
print(count,t())


