//
//  main.swift
//  ConcealedSquare
//
//  Created by Vincent Snow on 1/3/21.
//

import Foundation

var num = ["1","2","3","4","5","6","7","8","9","0"]
var largeInts: [Int] = []
var largeStr: [String] = []
var doubles: [Double] = []
//1x2x3x4x5x6x7x8x9x0
//smallest possible: 1020304050607080900
//largest possible: 1929394959697989900
//sqrt will be between 1010101010 and 1389026623
//its a range of 378925613
//in a 11 digit numbers 1_2_3_4_5_6 there's three answers
//yep 115256.0 13283945536
//yep 127334.0 16213947556
//yep 135254.0 18293644516

loooop: for i in 1010101009...1010101455
where (i*i) % 100 == 0 &&
    (String(i)[String(i).count-2] == "3" ||
        String(i)[String(i).count-2] == "7") {
    let s = String(i*i)
    print(i, i*i)
        if s[0] == "1" && s[2] == "2" && s[4] == "3" && s[6] == "4" && s[8] == "5" && s[10] == "6" && s[12] == "7" && s[14] == "8" && s[16] == "9" && s[18] == "0" {
            print("yay", i)
            break loooop
        }
}
let longstr = (1020304059000000000.0,1020304050000000000.0)
print(sqrt(longstr.0), sqrt(longstr.1))
 

//for iInt in 0...9 {
//    let i = String(iInt)
//    let str = num[0]+i+num[1]+i+num[2]+i+num[3]+i+num[4]+i+num[5]+i+num[6]+i+num[7]+i+num[8]+i+num[9]
//    print(str, str.count)
//    largeStr.append(str)
//    largeInts.append(Int(str) ?? 0)
//}
//for i in 1389026603...1389026623 {
//    print(i*i)
//}
func bruteForce2() {
    for x1 in num {
        for x2 in num {
            for x3 in num {
                for x4 in num {
                    for x5 in num {
                        for x6 in num {
                            for x7 in num {
                                let str = num[0]+x1+num[1]+x2+num[2]+x3+num[3]+x4+num[4]+x5+num[5]+x6+num[6]+x7+num[7]
                                if sqrt(Double(str)!).truncatingRemainder(dividingBy: 1) == 0 {
                                    print("yep", sqrt(Double(str)!),str)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}


func bruteForce() {
    for x1 in num {
        for x2 in num {
            for x3 in num {
                for x4 in num {
                    for x5 in num {
                        for x6 in num {
                            for x7 in num {
                                for x8 in num {
                                    for x9 in num {
                                        let str = num[0]+x1+num[1]+x2+num[2]+x3+num[3]+x4+num[4]+x5+num[5]+x6+num[6]+x7+num[7]+x8+num[8]+x9+num[9]
                                        if sqrt(Double(str)!).truncatingRemainder(dividingBy: 1) == 0 {
                                            print(sqrt(Double(str)!))
                                        }
                                        print(str)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
//bruteForce()
//for i in largeInts {
//    print(i, sqrt(Double(i)))
//    doubles.append(sqrt(Double(i)))
//}
//print(doubles.max()! - doubles.min()!)
// second to last digit has to be 0, 1, 4, 5, 6, 9
var test = [10,20,30,40,50,60,70,80,90,100]
var previous = 0
//for i in 1010101010...1010101020 {
//    let iSq = i*i
//    print(iSq, previous, (iSq) - previous)
//    previous = iSq
//}
//for i in 1389026603...1389026623 {
//    let iSq = i*i
//    print(iSq, previous, (iSq) - previous)
//    previous = iSq
//}

//for i in 1010101010...1389026623 where i % 30 == 0 {
//        largeStr[String(i*i)] = 1
//}

let arr1 = 1010101010...1389026623

//for i in largeStr {
//    if i[0] == "1" && i[2] == "2" && i[4] == "3" && i[6] == "4" && i[8] == "5" && i[10] == "6" && i[12] == "7" && i[14] == "8" && i[16] == "9" && i[18] == "0" {
//        print("yay", i)
//    }
//}
print("all done")
