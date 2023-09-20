//
//  main.swift
//  XORDecryption59
//
//  Created by Vincent Snow on 9/19/23.
//

import Foundation
import Algorithms

let unsigned: UInt8 = 7
let unsigned2: UInt8 = 107
//print(unsigned ^ unsigned2)

var intBits: [Int:[Int]] = [:]
var asciiInt: [Int:String] = [:]
var asciiStr: [String:String] = [:]
let key:[Unicode.Scalar] = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
var mess: [Int] = []
let f2 = input.components(separatedBy: ",")
let f1 = x.components(separatedBy: "\n")
var codeDict: [UInt8:Bool] = [:]
for i in 32...127 {
    codeDict[UInt8(i)]=true
}
codeDict[64] = false
codeDict[123] = false
codeDict[124] = false
//codeDict[125] = false
//codeDict[34] = false
//codeDict[35] = false
//codeDict[45] = false
//for i in 91...96 {
//    codeDict[UInt8(i)] = false
//}
//for i in 65...90 {
//    codeDict[UInt8(i)]=true
//}
//for i in 97...122 {
//    codeDict[UInt8(i)]=true
//}






for i in f2 {
    mess.append(Int(i)!)
}
var counter = 0
var sum = 0
print(mess.count)
aLoop: for let1 in key {
    bLoop: for let2 in key {
        cLoop:for let3 in key {
            let perm = [let1,let2,let3]
            let a = [UInt8(ascii: perm[0]),UInt8(ascii: perm[1]), UInt8(ascii: perm[2])]
            if a == [101,120,112] {
                let stri = stride(from: 0, through: mess.count-2, by: 3)
                var message: [[UnicodeScalar]] = []
                for ind in stri {
                    let one = UInt8(exactly: mess[ind])!
                    let two = UInt8(exactly: mess[ind+1])!
                    let three = UInt8(exactly: mess[ind+2])!
                    sum+=Int(a[0]^one)
                    sum+=Int(a[1]^two)
                    sum+=Int(a[2]^three)
                    let xor1 = UnicodeScalar(a[0]^one)
                    let xor2 = UnicodeScalar(a[1]^two)
                    let xor3 = UnicodeScalar(a[2]^three)
                    if codeDict[a[0]^one] != true {
                        continue aLoop
                    } else if codeDict[a[1]^two] != true {
                        continue bLoop
                    } else if codeDict[a[2]^three] != true {
                        continue cLoop
                    } else {
                        message.append([xor1,xor2,xor3])
                    }
                }
                for i in message {
                    for j in i {
                        print(j, terminator: "")
                    }
                }
            }
        }
    }
}
print(sum)
