//
//  main.swift
//  Coded Triangle Numbers
//
//  Created by Vincent Snow on 1/25/21.
//

import Foundation

var testInput = ["A","ABILITY","ABLE","ABOUT","ABOVE","ABSENCE","ABSOLUTELY","ACADEMIC","ACCEPT","ACCESS","ACCIDENT","ACCOMPANY","ACCORDING","ACCOUNT","ACHIEVE","ACHIEVEMENT","ACID","ACQUIRE","ACROSS","ACT","ACTION","ACTIVE","ACTIVITY","ACTUAL","ACTUALLY","ADD","ADDITION","ADDITIONAL","ADDRESS","ADMINISTRATION","ADMIT","ADOPT","ADULT","ADVANCE","ADVANTAGE","ADVICE","ADVISE","AFFAIR","AFFECT","AFFORD","AFRAID","AFTER","AFTERNOON","AFTERWARDS","AGAIN"]
let start = Date()
let alphabet: [Character:Int] = ["A":1,"B":2,"C":3,"D":4,"E":5,"F":6,"G":7,"H":8,"I":9,"J":10,"K":11,"L":12,"M":13,"N":14,"O":15,"P":16,"Q":17,"R":18,"S":19,"T":20,"U":21,"V":22,"W":23,"X":24,"Y":25,"Z":26]

var triDict: [Int:Bool] = [:]
for i in 1...500 {
    let tri = (i * (i + 1)) / 2
    triDict[tri] = true
}

var sum = 0
var highest = 0
var counter = 0
var triWord: [String] = []
for i in 0...input.count-1 {
    sum = 0
    for j in input[i] {
        sum+=alphabet[j]!
    }
    if sum > highest {
        highest = sum
    }
    if triDict[sum] == true {
        triWord.append(input[i])
        counter+=1
    }
}
print(counter, Date().timeIntervalSince(start))
