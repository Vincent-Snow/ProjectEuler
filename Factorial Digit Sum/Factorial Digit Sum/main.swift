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

//var x = 1.0
//var xstr = ""
//for i in 1...100 {
//    x*=Double(i)
//    xstr = String(x)
//    while xstr.last! == "0" {
//            xstr = String(xstr.dropLast())
//            x = Double(xstr)!
//    }
//    print(i, x, xstr)
//}
//var t = xstr.map({Int(String($0)) ?? 0 }).reduce(0, +)
//print(t)
//var longNumArray: [String] = []

//var tempArray: [String] = []
//let twentyFact = 5*4*3*2*1
//let twentyFact1 = 13*12*11*10*9*8*7*6*5*4*3*2*1

//var x = 1
//var fact = ""
//var product = ""
//print(twentyFact, twentyFact*x)
//var f = String(1)
var byWhat = 10
//print(f.count/byWhat)
//

//let largeNum2 = "12341234123412341234123412341234"
//var longNumArray2: [String] = []
//var largeNumReversed2 = String(largeNum2.reversed())
//let temp2 = largeNumReversed2.separate(every: 5, with: " ")
//longNumArray2 = temp2.components(separatedBy: " ").map({String($0.reversed())}).reversed()
//print(longNumArray2)

var test = "888777"
var result2 = 0
var ovrflw = 0
var fullanswer = ""
func reverse(_ s: String) -> [String] {
    var what: [String] = []
 for character in s {
    //str = "\(character)" + str
    what.insert(String(character), at: 0)
 }
 return what
}
var testrev = reverse(test)

for i in testrev {
    result2 = (Int(i)! * 8) + ovrflw
    
    if String(result2).count > 1 {
        var first = String(result2)
    } else {
        ovrflw = 0
    }
    fullanswer+=result2
}
print(fullanswer, reverse(fullanswer))

var overflow: Int = 0
func multiplyByLargeNum(largeNum: String, multiplyBy: Int) -> String {
    var longNumArray: [String] = []
    var answerArray: [String] = []
    let largeNumReversed = String(largeNum.reversed())
    let temp = largeNumReversed.separate(every: byWhat, with: " ")
    longNumArray = temp.components(separatedBy: " ").map({String($0.reversed())}).reversed()
//    print(longNumArray)
    var y = 1
    var yAsString = ""
    
    overflow = 0
    
    for j in longNumArray.reversed() {
            y = (multiplyBy * Int(j)!) + overflow
            if y == 0 {
                yAsString = "0000000000"
            } else {
                yAsString = String(y)
            }
            if yAsString.count > byWhat {
                answerArray.insert(String(yAsString.suffix(byWhat)), at: 0)
                overflow = Int(yAsString.prefix(yAsString.count-byWhat))!
                if String(j) == longNumArray[0] {
                    answerArray.insert(String(overflow), at: 0)
                }
            } else {
                answerArray.insert(String(yAsString.suffix(byWhat)), at: 0)
                overflow = 0
            }
//        print(answerArray)
//        print(y)
        }
//    print(answerArray)
    return answerArray.joined()
}

//print(multiplyByLargeNum(largeNum: "9426890448883247745626185743057242473809693764078951663494238777294707070023223798882976159207729119823605850588608460429412647567360000000000000000000000", multiplyBy: 99))

var x = 1
for i in 1...20 {
    x*=i
    print(i, x)
}

var z = "1"
for i in 1...100 {
    z = multiplyByLargeNum(largeNum: z, multiplyBy: i)
//    print(i, z)
}

var fact100 = "93326215443944152681699238856266700490715968264381621468592963895217599993229915608941463976156518286253697920827223758251185210916864000000000000000000000000"
//print(fact100)
if z == fact100 {
    print("yes")
}
print(z.reduce(0, {$0 + (Int(String($1)) ?? 0)}))


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

