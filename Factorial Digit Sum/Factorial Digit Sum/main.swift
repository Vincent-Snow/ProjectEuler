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

//for i in 1...15 {
//    print(factorial(a: i))
//}

//var longNumArray: [String] = []

var tempArray: [String] = []
let twentyFact = 5*4*3*2*1
let twentyFact1 = 13*12*11*10*9*8*7*6*5*4*3*2*1
var overflow: Int = 0
var x = 1
var fact = ""
var product = ""
//print(twentyFact, twentyFact*x)
var f = String(1)
var byWhat = 10
//print(f.count/byWhat)

for i in 1...20 {
    x*=i
    print(x)
}
let largeNum = "12341234123412341234123412341234"
var longNumArray: [String] = []
var largeNumReversed = String(largeNum.reversed())
print(largeNumReversed)
let temp = largeNumReversed.separate(every: 5, with: " ")
longNumArray = temp.components(separatedBy: " ").map({String($0.reversed())}).reversed()
print(longNumArray)



func multiplyByLargeNum(largeNum: String, multipleBy: Int) -> String {
    var longNumArray: [String] = []
    let temp = largeNum.separate(every: 5, with: " ")
    longNumArray = temp.components(separatedBy: " ")
    var y = 1
    var yAsString = ""
    
        overflow = 0
        for j in longNumArray {
            y = (x * Int(j)!) + overflow
            yAsString = String(y)
            if yAsString.count > 5 {
                tempArray.insert(String(yAsString.suffix(5)), at: 0)
                overflow = Int(yAsString.prefix(yAsString.count-5))!
            } else {
                tempArray.insert(String(yAsString.suffix(5)), at: 0)
                overflow = 0
            }
        }
        
    return longNumArray.joined()
}






//for i in 1...15 {
//    tempArray = []
//    if longNumArray.count > 0 {
//        overflow = 0
//        for j in longNumArray.reversed() {
//            y = (i * Int(j)!) + overflow
//            yAsString = String(y)
//            if yAsString.count > 5 {
//                tempArray.insert(String(yAsString.suffix(5)), at: 0)
//                overflow = Int(yAsString.prefix(yAsString.count-5))!
//            } else {
//                tempArray.insert(String(yAsString.suffix(5)), at: 0)
//                overflow = 0
//            }
//        }
//        print(tempArray)
//        longNumArray = tempArray
//    } else {
//        y*=i
//        yAsString = String(y)
//        longNumArray.append(yAsString)
//    }
//    print(longNumArray.joined())
//}

//let t = ["a","b","c","d","e"]
//print(t.joined())
//
////for j in 1...20 {
//    for i in 0...f.count/byWhat {
//        //let other = f.prefix(f.count-(byWhat*i))
//        //let first = other.suffix(byWhat)
//        product = String((Int(first)!*x) + overflow)
//        print(other, first)
//        if product.count > first.count {
//            overflow = Int(product.prefix(product.count - first.count))!
//        }
//
//    }
//    longNumArray.insert(String(product.suffix(byWhat)), at: 0)
//    f = longNumArray.joined()
//    print("length", f)
////}
//print("fact", fact, fact.count)
//let intFact = fact.map({Int(String($0))!})
//print(intFact.reduce(0,+))

//factorial of 20 = 2432902008176640000



//var firstThirteenArray: [Double] = []
//let largeArray = input.components(separatedBy: "\n")
//
//for i in largeArray {
//    let firstThirteen = String(i.prefix(13))
//    firstThirteenArray.append(Double(firstThirteen) ?? 0)
//}
//
//print(firstThirteenArray.reduce(0, +))

