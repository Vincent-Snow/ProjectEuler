//
//  main.swift
//  BouncyNumbers
//
//  Created by Vincent Snow on 12/21/20.
//
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

import Foundation
var greaterCounter = 0
var lesserCounter = 0
var bouncyNumbers: Set<Int> = []
var highNum = 1587000
var bouncyCount = 0.0
bigLoop: for i in 100...highNum {
    lesserCounter = 0
    greaterCounter = 0
    let numstr = String(i)

    numstrLoop: for j in 0...numstr.count-1 {
        if j + 1 > numstr.count-1 {
            break numstrLoop
        }
        
        let current = numstr[j].wholeNumberValue ?? 0
        let next = numstr[j+1].wholeNumberValue ?? 0
        if current > next {
            greaterCounter+=1
        } else if current < next {
            lesserCounter+=1
        }
        if greaterCounter > 0 && lesserCounter > 0 {
            //bouncyNumbers.insert(Int(numstr)!)
            //print(numstr)
            bouncyCount+=1.0
            if highNum > 1500000 {
                if bouncyCount/Double(highNum) == 0.99 {
                    print(numstr)
                    break bigLoop
                }
            }
            continue bigLoop
        }
    }
}
print(bouncyNumbers.count, bouncyCount/Double(highNum))

//1599875
