//
//  main.swift
//  Factorial Digit Sum
//
//  Created by Vincent Snow on 12/27/20.
//

import Foundation

extension StringProtocol {
    subscript(offset: Int) -> Character { self[index(startIndex, offsetBy: offset)] }
    subscript(range: Range<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: ClosedRange<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: PartialRangeFrom<Int>) -> SubSequence { self[index(startIndex, offsetBy: range.lowerBound)...] }
    subscript(range: PartialRangeThrough<Int>) -> SubSequence { self[...index(startIndex, offsetBy: range.upperBound)] }
    subscript(range: PartialRangeUpTo<Int>) -> SubSequence { self[..<index(startIndex, offsetBy: range.upperBound)] }
}
extension String {

    func separate(every: Int, with separator: String) -> String {
        return String(stride(from: 0, to: Array(self).count, by: every).map {
            Array(Array(self)[$0..<min($0 + every, Array(self).count)])
        }.joined(separator: separator))
    }
}

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
print(ar1.reduce(0, {$0 + (Int(String($1)) ?? 0)}))
