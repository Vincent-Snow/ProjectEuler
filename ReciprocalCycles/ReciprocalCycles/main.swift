//
//  main.swift
//  ReciprocalCycles
//
//  Created by Vincent Snow on 1/6/21.
//

import Foundation

var num = 0
var den = 1
var div = 0
var r = 0
var ans:[Int] = []
var divs:[Int] = []
var longest = (0,0)

func rec(_ den: Int) {
    var den = den
//    if ans.count > 25 {
//        return
//    }

    while num > den {
        den*=10
        ans.append(0)
    }
    div = den/num
    r = den % num
    if divs.contains(r) {
        let ind = divs.firstIndex(of: r)
        let patLength = divs.count - ind!
        if patLength > longest.1 {
            longest = (num,patLength)
        }
        return
    } else {
        divs.append(r)
    }
    
    ans.append(div)
    if den % num == 0 {
        return
    } else {
        den = den % num
        den*=10
        rec(den)
    }
}

for i in 1...1000 {
    num = i
    ans = []
    divs = []
    r = 0
    rec(1)
    print(i,ans,longest)
}
