//
//  main.swift
//  Cyclical figurate numbers
//
//  Created by Vincent Snow on 2/25/21.
//

import Foundation

//print(sq)
//print(tri)
//print(pent)
//print(hex)
//print(hept)
//print(oct)
let u = 9999
var tri: [Int: Bool] = [:]
var sq: [Int: Bool] = [:]
var pent: [Int: Bool] = [:]
var hex: [Int: Bool] = [:]
var hept: [Int: Bool] = [:]
var oct: [Int: Bool] = [:]

for n in 1...u {
    
    let sqN = n*n
    sq[sqN] = true
    let triN = (n*(n+1))/2
    tri[triN] = true
    let pentN = (n*((3*n)-1))/2
    pent[pentN] = true
    let hexN = n*((2*n)-1)
    hex[hexN] = true
    let heptN = (n*((5*n)-3))/2
    hept[heptN] = true
    let octN = n*((3*n)-2)
    oct[octN] = true
}
func s(_ n:Int) {
    
    if sq[n] == true {
        print("sq")
    } else if hex[n] == true {
        print("hex")
    } else if tri[n] == true {
        print("tri")
    } else if pent[n] == true {
        print("pent")
    } else if hept[n] == true {
        print("hept")
    } else if oct[n] == true {
        print("oct")
    }
}

var count = 0
var starters: [Int:Bool] = [:]
i:for i in 1000...u {
    if sq[i] == true || tri[i] == true || pent[i] == true || hex[i] == true || hept[i] == true || oct[i] == true {
        let lastTwo = i % 100
        if lastTwo < 10 {
            continue i
        }
        starters[i] = true
    }
}

for key in starters.keys.sorted() {
    let lastTwo = (key % 100) * 100
    for i in 10...99 {
        let num = lastTwo+i
        if sq[num] == true || tri[num] == true || pent[num] == true || hex[num] == true || hept[num] == true || oct[num] == true {
            print(key,num)
            s(key)
            s(num)
            count+=1
        }
    }
}
print(count)
