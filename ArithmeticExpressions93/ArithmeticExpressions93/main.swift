//
//  main.swift
//  ArithmeticExpressions93
//
//  Created by Vincent Snow on 10/22/22.
//

import Foundation
import Algorithms

let x = [1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0]
//let x = [1,2,3,4]
var c = 0
//

//print(c)
//
//for i in f.permutations(ofCount: 4) {
//    print(i)
//    c+=1
//}
//
//print(c)

// 1, 2, 3, 4
// (1, 2), 3, 4 [0,4] // 1, (2, 3), 4 [2, 6] // 1, 2, (3, 4) [4, 8]
// (1, 2), (3, 4) [0, 4, 6, 10]
//(1, 2, 3), 4 [0, 6] // 1, (2, 3, 4) [2, 8]
// (1, (2, 3)), 4 [0, 3, 7, 8] // ((1, 2), 3), 4 [0, 1, 6, 8]
// 1, (2, (3, 4)) [2, 5, 9, 10] // 1, ((2, 3), 4) [2, 3, 7, 10]

let paranthArr: [[Int]] = [[0,4], [2, 6], [4, 8], [0, 4, 6, 10], [0, 6], [2, 8], [0, 3, 7, 8], [0, 1, 5, 8], [2, 5, 9, 10], [2, 3, 7, 10]]
// +++ --- *** ///
let signs = ["+","+","+","-","-","-","*","*","*","/","/","/"]
var signsSet: Set<[String]> = []
for i in signs.permutations(ofCount: 3) {
//    print(i)
    signsSet.insert(i)
}
var expArr: [[String]] = []
var expArrwPara: [[String]] = []
for f in x.permutations(ofCount: 4) {
    for i in signsSet {
        let arr = [String(f[0]),i[0],String(f[1]),i[1],String(f[2]),i[2],String(f[3])]
        expArr.append(arr)
        print("\(f[0]) \(i[0]) \(f[1]) \(i[1]) \(f[2]) \(i[2]) \(f[3])")
    }
    //print(i)
    //c+=1
}
var count = 0
for arr in expArr {
    expArrwPara.append(arr)
    for j in paranthArr {
        var pArr = arr
        if j.count == 2 {
            pArr.insert("(", at: j[0])
            pArr.insert(")", at: j[1])
        } else if j == [0,4,6,10] {
            pArr.insert("(", at: j[0])
            pArr.insert(")", at: j[1])
            pArr.insert("(", at: j[2])
            pArr.insert(")", at: j[3])
        } else {
            pArr.insert("(", at: j[0])
            pArr.insert("(", at: j[1])
            pArr.insert(")", at: j[2])
            pArr.insert(")", at: j[3])
        }
        expArrwPara.append(pArr)
    }
}
//for i in expArrwPara {
//    print(i)
//}
var prev: [Double] = []
var appArr: [String:[Int]] = [:]
var ar: [Int] = []
for i in expArrwPara {
    let t1 = Double(i[0]) ?? 10.0, t2 = Double(i[2]) ?? 10.0,t3 = Double(i[4]) ?? 10.0, t4 = Double(i[6]) ?? 10.0
    var curr = [t1,t2,t3,t4]
    var s = ""
    if t1 != 10.0 && t2 != 10.0 && t3 != 10.0 && t4 != 10.0 && prev != curr {

        prev=[t1,t2,t3,t4]
        print("\n\n\n\n\n\n\n\n\n")
        
        appArr[s] = ar
        s = String(Int(t1))+String(Int(t2))+String(Int(t3))+String(Int(t4))
        ar = []

    }
    var str = ""
    for j in i {
        str.append(j)
    }
    count+=1
    let expn = NSExpression(format:str)
    let value = expn.expressionValue(with: nil, context: nil)!
//    print(value)
//    NSNumber(value).compare(inf)
//    print(str)
//    let isInteger = floor(value as! Double) == value as! Double
//    if isInteger {
//        //print(value)
//        var num = value as! NSNumber
//        var int = num as! Int
//        ar.append(int)
//
//    }

}
//let isInteger = floor(dbl) == dbl
for i in appArr {
    print(i.key, i.value.sorted())
}
print(count)
