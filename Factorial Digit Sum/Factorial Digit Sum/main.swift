//
//  main.swift
//  Factorial Digit Sum
//
//  Created by Vincent Snow on 12/27/20.
//

import Foundation
let start = Date()
func factorial(a: Int) -> Int {
    let n = a
    if(n == 1){
      return 1
    }else{
        return n*factorial(a:n-1)
    }
}

func bigNum(strLongN:String, num:Int) -> String {
    let longN = rev(s: strLongN)
    var ar: [Int] = []
    ovrflw = 0
    
    for i in 0...longN.count-1 {
        var prod = (longN[i] * num) + ovrflw
        if prod >= 10 {
            ovrflw = (prod - (prod % 10)) / 10
            prod = prod % 10
        } else {
            ovrflw = 0
        }
        
        ar.insert(prod, at: 0)
        if i == longN.count-1 && ovrflw != 0{
            ar.insert(ovrflw, at: 0)
        }
    }
    let x = ar.map({String($0)}).joined()
    return x
}

func rev(s:String) -> [Int] {
    var ar: [Int] = []
    for char in s {
        ar.insert(Int(String(char))!, at: 0)
    }
    return ar
}

func revInt(arr: [Int]) -> [Int] {
    return arr.reversed() // we return here
}

var ovrflw = 0
var ar1 = "1"
for i in 1...100 {
    ar1 = bigNum(strLongN: ar1, num: i)
    print(ar1)
}

print(ar1.reduce(0, {$0 + (Int(String($1)) ?? 0)}), Date().timeIntervalSince(start))
