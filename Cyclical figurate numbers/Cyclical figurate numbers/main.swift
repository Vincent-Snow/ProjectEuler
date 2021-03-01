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
let c = ["sq","tri","pent","hex","hept","oct"]
var comp: [String] = []
var nums: [Int] = []
var dictArr: [[Int:Bool]:String] = [:]
func check(_ d: [Int: Bool], _ n: Int) -> Bool {
    if d[n] == true {
        return true
    } else {
        return false
    }
}

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
dictArr = [sq:"sq",tri:"tri",pent:"pent",hex:"hex",hept:"hept",oct:"oct"]
func s(_ n:Int) -> String {
    
    if sq[n] == true {
        print("sq")
        return "sq"
    } else if hex[n] == true {
        print("hex")
        return "hex"
    } else if tri[n] == true {
        print("tri")
        return "tri"
    } else if pent[n] == true {
        print("pent")
        return "pent"
    } else if hept[n] == true {
        print("hept")
        return "hept"
    } else if oct[n] == true {
        print("oct")
        return "oct"
    }
    return ""
}

var count = 0
var starters: [Int:Bool] = [:]
i:for i in 1000...u {
    if check(sq,i) || check(tri, i) || check(pent, i) || check(hex, i) || check(hept, i) || check(oct, i) {
        let lastTwo = i % 100
        if lastTwo < 10 {
            continue i
        }
        starters[i] = true
    }
}
var outerCount = 0
func progress(_ num: Int) {
    for i in dictArr {
        if check(i.key, num) {
            
        }
    }
    if check(sq, num) {
        if comp.contains(c)
    } else if check(tri, num) {
    
    } else if check(pent, num) {
        
    } else if check(hex, num) {
        
    } else if check(hept,num) {
        
    } else if check(oct, num) {
        
    }
}
func loooop(_ n: Int) -> Int {
    i:for i in 10...99 {
        let num = n+i
        if check(sq, num) {
            if comp.contains(c)
        } else if check(tri, num) {
        
        } else if check(pent, num) {
            
        } else if check(hex, num) {
            
        } else if check(hept,num) {
            
        } else if check(oct, num) {
            
        }
        
        if sq[num] == true || tri[num] == true || pent[num] == true || hex[num] == true || hept[num] == true || oct[num] == true {
            comp.append(s(num))
            count+=1
            if count == 6 && comp == c {
                print(<#T##items: Any...##Any#>)
            }
            loooop(n%100)
        }
        outerCount+=1
    }
}

for key in starters.keys.sorted() {
    let lastTwo = (key % 100) * 100
    nums.append(key)
    comp.append(s(key))
    for i in 10...99 {
        let num = lastTwo+i
        if sq[num] == true || tri[num] == true || pent[num] == true || hex[num] == true || hept[num] == true || oct[num] == true {
            print(key,num)
            s(key)
            s(num)
            count+=1
        }
    }
    if comp == c {
        print(<#T##items: Any...##Any#>)
    }
}
print(count)
