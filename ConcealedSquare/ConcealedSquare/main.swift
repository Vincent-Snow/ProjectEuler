//
//  main.swift
//  ConcealedSquare
//
//  Created by Vincent Snow on 1/3/21.
//

import Foundation

//1x2x3x4x5x6x7x8x9x0
//smallest possible: 1020304050607080900
//largest possible: 1929394959697989900
//sqrt will be between 1010101010 and 1389026623
//its a range of 378925613
//in a 11 digit numbers 1_2_3_4_5_6 there's three answers
//yep 115256.0 13283945536
//yep 127334.0 16213947556
//yep 135254.0 18293644516

var num = ["1","2","3","4","5","6","7","8","9","0"]
let start = Date()

var stri = stride(from: 101010107, to: 138902662, by: 10)
func looooop(stri: StrideTo<Int>) {
    loooop: for i in stri {
        let s = String(i*i*100)
        if s[0] == "1" && s[2] == "2" && s[4] == "3" && s[6] == "4" && s[8] == "5" && s[10] == "6" && s[12] == "7" && s[14] == "8" && s[16] == "9" && s[18] == "0" {
            print("yay", i)
            break loooop
        }
    }
}
looooop(stri: stri)
let elapsed = Date().timeIntervalSince(start)
print(elapsed)

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


