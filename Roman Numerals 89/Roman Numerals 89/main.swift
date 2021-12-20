//
//  main.swift
//  Roman Numerals 89
//
//  Created by Vincent Snow on 12/11/21.
//

import Foundation

let r = ["IIIIIIIIIIIIIIII","VIIIIIIIIIII","VVIIIIII","XIIIIII","VVVI","XVI","XIX","XLIX","MCCCCCCVI","XCIV"]
let rHash: [String: Int] = ["I":1, "V":5,"X":10,"L":50,"C":100,"D":500,"M":1000]
let inputArr = input.split(separator: "\n")
func convertToRomanNumeral(_ n:Int) -> String {
    var tup = (n,"")
    tup = helper(tup.0, tup.1, 1000, "M")
    if tup.0 - tup.0 % 900 == 900 {
        tup.0-=900
        tup.1+="CM"
    }
    tup = helper(tup.0, tup.1, 500, "D")
    if tup.0 - tup.0 % 400 == 400 {
        tup.0-=400
        tup.1+="CD"
    }
    tup = helper(tup.0, tup.1, 100, "C")
    if tup.0 - tup.0 % 90 == 90 {
        tup.0-=90
        tup.1+="XC"
    }
    tup = helper(tup.0, tup.1, 50, "L")
    if tup.0 - tup.0 % 40 == 40 {
        tup.0-=40
        tup.1+="XL"
    }
    tup = helper(tup.0, tup.1, 10, "X")
    if tup.0 - tup.0 % 9 == 9 {
        tup.0-=9
        tup.1+="IX"
    }
    tup = helper(tup.0, tup.1, 5, "V")
    if tup.0 - tup.0 % 4 == 4 {
        tup.0-=4
        tup.1+="IV"
    }
    tup = helper(tup.0, tup.1, 1, "I")
    return tup.1
}
func helper(_ n: Int, _ rn: String, _ rnVal: Int, _ rnStr: String) -> (Int, String) {
    var n = n
    var rn = rn
    while n >= rnVal {
        rn += rnStr
        n-=rnVal
    }
    return (n, rn)
}
func convertFromRomanNumeral(_ rn: String) -> Int {
    
    var val = 0
    var j = 0
    jLoop: while (j < rn.count) {
        var next = ""
        if j + 1 != rn.count {
            next = String(rn[j+1])
        }
        let cur = String(rn[j])
        if cur == "I" && next == "V" {
            val+=4
        } else if cur == "I" && next == "X" {
            val+=9
        } else if cur == "X" && next == "L" {
            val+=40
        } else if cur == "X" && next == "C" {
            val+=90
        } else if cur == "C" && next == "D" {
            val+=400
        } else if cur == "C" && next == "M" {
            val+=900
        } else {
            val+=rHash[cur]!
            j+=1
            continue jLoop
        }
        j+=2
    }
    return val
}

var c = 0
for i in inputArr {
    let str = String(i)
    let num = convertFromRomanNumeral(str)
    let convert = convertToRomanNumeral(num)
    c+=str.count-convert.count
    print(num,str,convert)
    
}
print(c)
