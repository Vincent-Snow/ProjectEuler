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
//smallest possible: 1020304050607080900
//largest possible: 1929394959697989900
//sqrt will be between 1010101010 and 1389026623
000000000
999999999
//its a range of 378925613
//for iInt in 0...9 {
//    let i = String(iInt)
//    let str = num[0]+i+num[1]+i+num[2]+i+num[3]+i+num[4]+i+num[5]+i+num[6]+i+num[7]+i+num[8]+i+num[9]
//    print(str, str.count)
//    largeStr.append(str)
//    largeInts.append(Int(str) ?? 0)
//}

//for i in largeInts {
//    print(i, sqrt(Double(i)))
//    doubles.append(sqrt(Double(i)))
//}
//print(doubles.max()! - doubles.min()!)
// second to last digit has to be 0, 1, 4, 5, 6, 9
var test = [10,20,30,40,50,60,70,80,90,100]
for i in 10...10000 {
    if i^^2 % 30 == 0 {
        print(i, i^^2)
    }
}
for i in 1010101010...1389026623 {
    if i % 30 == 0 {
        largeStr.append(String(i^^2))
    }
}

for i in largeStr {
    if i[0] == "1" && i[2] == "2" && i[4] == "3" && i[6] == "4" && i[8] == "5" && i[10] == "6" && i[12] == "7" && i[14] == "8" && i[16] == "9" && i[18] == "0" {
        print("yay", i)
    }
}
print("all done")
