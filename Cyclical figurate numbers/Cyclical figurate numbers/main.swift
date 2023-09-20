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
let u = 10000
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
var snums: Set<Int> = []
var firstTwo: [String:Int] = [:]
var lastTwo: [String:Int] = [:]
var fTri: [String:Bool] = [:]
var fSq: [String:Bool] = [:]
var fPent: [String:Bool] = [:]
var fHex: [String:Bool] = [:]
var fHept: [String:Bool] = [:]
var fOct: [String:Bool] = [:]
var lTri: [String:Bool] = [:]
var lSq: [String:Bool] = [:]
var lPent: [String:Bool] = [:]
var lHex: [String:Bool] = [:]
var lHept: [String:Bool] = [:]
var lOct: [String:Bool] = [:]

func check(_ d: [Int: Bool], _ n: Int) -> Bool {
    if d[n] == true {
        return true
    } else {
        return false
    }
}

for n in 1...u {
    
    let sqN = n*n
    if sqN < u && sqN >= 1000 && String(sqN)[2] != "0" {
        sq[sqN] = true
        snums.insert(sqN)
        fSq[String(String(sqN).prefix(2))] = true
        lSq[String(String(sqN).suffix(2))] = true
    }
    let triN = (n*(n+1))/2
    if triN < u && triN >= 1000 && String(triN)[2] != "0" {
        tri[triN] = true
        snums.insert(triN)
        fTri[String(String(triN).prefix(2))] = true
        lTri[String(String(triN).suffix(2))] = true
    }
    let pentN = (n*((3*n)-1))/2
    if pentN < u && pentN >= 1000 && String(pentN)[2] != "0" {
        pent[pentN] = true
        snums.insert(pentN)
        fPent[String(String(pentN).prefix(2))] = true
        lPent[String(String(pentN).suffix(2))] = true
    }
    let hexN = n*((2*n)-1)
    if hexN < u && hexN >= 1000 && String(hexN)[2] != "0" {
        hex[hexN] = true
        snums.insert(hexN)
        fHex[String(String(hexN).prefix(2))] = true
        lHex[String(String(hexN).suffix(2))] = true
    }
    let heptN = (n*((5*n)-3))/2
    if heptN < u && heptN >= 1000 && String(heptN)[2] != "0" {
        hept[heptN] = true
        snums.insert(heptN)
        fHept[String(String(heptN).prefix(2))] = true
        lHept[String(String(heptN).suffix(2))] = true
    }
    let octN = n*((3*n)-2)
    if octN < u && octN >= 1000 && String(octN)[2] != "0" {
        oct[octN] = true
        snums.insert(octN)
        fOct[String(String(octN).prefix(2))] = true
        lOct[String(String(octN).suffix(2))] = true
    }
}
//for i in tri.keys.sorted() {
//    print(i)
//}
//for i in sq.keys.sorted() {
//    print(i)
//}
//for i in pent.keys.sorted() {
//    print(i)
//}
//for i in hex.keys.sorted() {
//    print(i)
//}
//for i in hept.keys.sorted() {
//    print(i)
//}
//for i in oct.keys.sorted() {
//    print(i)
//}
print(tri.count)
print(sq.count)
print(pent.count)
print(hex.count)
print(hept.count)
print(oct.count)
var counter = 0
func run() {
    for i in oct.keys.sorted() {
        let f2 = String(String(i).prefix(2))
        let l2 = String(String(i).suffix(2))
        if (fTri[l2] == true || fSq[l2] == true || fPent[l2] == true || fHex[l2] == true || fHept[l2] == true) && (lTri[f2] == true || lSq[f2] == true || lPent[f2] == true || lHex[f2] == true || lHept[f2] == true) {
            counter+=1
            //print(i)
        } else {
            oct.removeValue(forKey: i)
        }
    }
    for i in hept.keys.sorted() {
        let f2 = String(String(i).prefix(2))
        let l2 = String(String(i).suffix(2))
        if (fTri[l2] == true || fSq[l2] == true || fPent[l2] == true || fHex[l2] == true || fOct[l2] == true) && (lTri[f2] == true || lSq[f2] == true || lPent[f2] == true || lHex[f2] == true || lOct[f2] == true) {
            counter+=1
            //print(i)
        } else {
            hept.removeValue(forKey: i)
        }
    }
    for i in hex.keys.sorted() {
        let f2 = String(String(i).prefix(2))
        let l2 = String(String(i).suffix(2))
        if (fTri[l2] == true || fSq[l2] == true || fPent[l2] == true || fHept[l2] == true || fOct[l2] == true) && (lTri[f2] == true || lSq[f2] == true || lPent[f2] == true || lHept[f2] == true || lOct[f2] == true) {
            counter+=1
            //print(i)
        } else {
            hex.removeValue(forKey: i)
        }
    }
    for i in pent.keys.sorted() {
        let f2 = String(String(i).prefix(2))
        let l2 = String(String(i).suffix(2))
        if (fTri[l2] == true || fSq[l2] == true || fHex[l2] == true || fHept[l2] == true || fOct[l2] == true) && (lTri[f2] == true || lSq[f2] == true || lHex[f2] == true || lHept[f2] == true || lOct[f2] == true) {
            counter+=1
            //print(i)
        } else {
            pent.removeValue(forKey: i)
        }
    }
    for i in sq.keys.sorted() {
        let f2 = String(String(i).prefix(2))
        let l2 = String(String(i).suffix(2))
        if (fTri[l2] == true || fPent[l2] == true || fHex[l2] == true || fHept[l2] == true || fOct[l2] == true) && (lTri[f2] == true || lPent[f2] == true || lHex[f2] == true || lHept[f2] == true || lOct[f2] == true) {
            counter+=1
            //print(i)
        } else {
            sq.removeValue(forKey: i)
        }
    }
    for i in tri.keys.sorted() {
        let f2 = String(String(i).prefix(2))
        let l2 = String(String(i).suffix(2))
        if (fSq[l2] == true || fPent[l2] == true || fHex[l2] == true || fHept[l2] == true || fOct[l2] == true) && (lSq[f2] == true || lPent[f2] == true || lHex[f2] == true || lHept[f2] == true || lOct[f2] == true) {
            counter+=1
            //print(i)
        } else {
            tri.removeValue(forKey: i)
        }
    }
    print("")
    print(tri.count)
    print(sq.count)
    print(pent.count)
    print(hex.count)
    print(hept.count)
    print(oct.count)

    fOct=[:]
    lOct=[:]
    for i in oct.keys.sorted() {
        fOct[String(String(i).prefix(2))] = true
        lOct[String(String(i).suffix(2))] = true
    }
    fHept=[:]
    lHept=[:]
    for i in hept.keys.sorted() {
        fHept[String(String(i).prefix(2))] = true
        lHept[String(String(i).suffix(2))] = true
    }
    fHex=[:]
    lHex=[:]
    for i in hex.keys.sorted() {
        fHex[String(String(i).prefix(2))] = true
        lHex[String(String(i).suffix(2))] = true
    }
    fPent=[:]
    lPent=[:]
    for i in pent.keys.sorted() {
        fPent[String(String(i).prefix(2))] = true
        lPent[String(String(i).suffix(2))] = true
    }
    fSq=[:]
    lSq=[:]
    for i in sq.keys.sorted() {
        fSq[String(String(i).prefix(2))] = true
        lSq[String(String(i).suffix(2))] = true
    }
    fTri=[:]
    lTri=[:]
    for i in tri.keys.sorted() {
        fTri[String(String(i).prefix(2))] = true
        lTri[String(String(i).suffix(2))] = true
    }
}
for i in 1...3 {
    run()
}
for i in oct.keys {
    print(i)
}

//print(snums.count)
//print(sq.count+tri.count+pent.count+hex.count+hept.count+oct.count)
//print(sq.count,tri.count,pent.count,hex.count,hept.count,oct.count)
//for i in snums.sorted() {
//    print(i)
//}
//for i in oct.keys.sorted() {
//    print(i)
//}
iLoop: for i in snums {
    let str = String(i)
    if str[2] == "0" {
        continue iLoop
    }
    let pre = String(str.prefix(2))
    let su = String(str.suffix(2))
    if firstTwo[pre] == nil {
        firstTwo[pre] = 1
    } else {
        let f = firstTwo[pre]!+1
        firstTwo[pre] = f
    }
    if lastTwo[su] == nil {
        lastTwo[su] = 1
    } else {
        let g = lastTwo[su]!+1
        lastTwo[su] = g
    }
}
//print(lastTwo.count,firstTwo.count)
//for i in lastTwo {
//    print(i.key,i.value)
//}
//print("\n\n\n\n\n\n")
//for i in firstTwo {
//    print(i.key,i.value)
//}
var asdf = 0
for i in firstTwo.keys.sorted() {
    if lastTwo[i] != nil {
        //print(i)
        asdf+=1
    }
}
//print(asdf, firstTwo.count)
var asdfasdf = 0
for i in lastTwo.keys.sorted() {
    if firstTwo[i] != nil {
        //print(i)
        asdfasdf+=1
    }
}
//print(asdfasdf, lastTwo.count)
//dictArr = [sq:"sq",tri:"tri",pent:"pent",hex:"hex",hept:"hept",oct:"oct"]
//func s(_ n:Int) -> String {
//
//    if sq[n] == true {
//        print("sq")
//        return "sq"
//    } else if hex[n] == true {
//        print("hex")
//        return "hex"
//    } else if tri[n] == true {
//        print("tri")
//        return "tri"
//    } else if pent[n] == true {
//        print("pent")
//        return "pent"
//    } else if hept[n] == true {
//        print("hept")
//        return "hept"
//    } else if oct[n] == true {
//        print("oct")
//        return "oct"
//    }
//    return ""
//}
//
//var count = 0
//var starters: [Int:Bool] = [:]
//i:for i in 1000...u {
//    if check(sq,i) || check(tri, i) || check(pent, i) || check(hex, i) || check(hept, i) || check(oct, i) {
//        let lastTwo = i % 100
//        if lastTwo < 10 {
//            continue i
//        }
//        starters[i] = true
//    }
//}
//var outerCount = 0
//func progress(_ num: Int) {
//    for i in dictArr {
//        if check(i.key, num) {
//
//        }
//    }
//    if check(sq, num) {
//        if comp.contains(c)
//    } else if check(tri, num) {
//
//    } else if check(pent, num) {
//
//    } else if check(hex, num) {
//
//    } else if check(hept,num) {
//
//    } else if check(oct, num) {
//
//    }
//}
//func loooop(_ n: Int) -> Int {
//    i:for i in 10...99 {
//        let num = n+i
//        if check(sq, num) {
//            if comp.contains(c)
//        } else if check(tri, num) {
//
//        } else if check(pent, num) {
//
//        } else if check(hex, num) {
//
//        } else if check(hept,num) {
//
//        } else if check(oct, num) {
//
//        }
//
//        if sq[num] == true || tri[num] == true || pent[num] == true || hex[num] == true || hept[num] == true || oct[num] == true {
//            comp.append(s(num))
//            count+=1
//            if count == 6 && comp == c {
//                print(<#T##items: Any...##Any#>)
//            }
//            loooop(n%100)
//        }
//        outerCount+=1
//    }
//}
//
//for key in starters.keys.sorted() {
//    let lastTwo = (key % 100) * 100
//    nums.append(key)
//    comp.append(s(key))
//    for i in 10...99 {
//        let num = lastTwo+i
//        if sq[num] == true || tri[num] == true || pent[num] == true || hex[num] == true || hept[num] == true || oct[num] == true {
//            print(key,num)
//            s(key)
//            s(num)
//            count+=1
//        }
//    }
//    if comp == c {
//        print(<#T##items: Any...##Any#>)
//    }
//}
//print(count)
