//
//  main.swift
//  SingularIntegerRightTriangles75
//
//  Created by Vincent Snow on 7/30/22.
//

import Foundation

func gcdRecursiveEuklid(_ m: Int, _ n: Int) -> Int {
    let r: Int = m % n
    if r != 0 {
        return gcdRecursiveEuklid(n, r)
    } else {
        return n
    }
}
var count = 0
var pythDict: [Int: [[Int]]] = [:]
let u = 1000
mLoop: for m in 1...u {
    let stri = stride(from: m+1, to: u+1, by: 2)
    for n in stri {
        if gcdRecursiveEuklid(m, n) == 1 {
            let a = n*n-m*m
            let b = 2*m*n
            let c = m*m+n*n
            if (a+b+c) > 1500000 {
                continue mLoop
            }
            let trip = [a,b,c].sorted()
            if pythDict[a+b+c]?.count == nil {
                pythDict[a+b+c] = [trip]
            } else {
                var temp = pythDict[a+b+c]
                temp?.append(trip)
                pythDict[a+b+c] = temp
            }
        }
    }
}
tripLoop: for trip in pythDict.keys {
    var i = 2
    while trip * i < 1500000 {
        let num = trip*i
        let x = pythDict[trip]!
        let temp = x[0].map({ $0 * i })

        if pythDict[num]?.count == nil {
            pythDict[num] = [temp]
        } else {
            var t = pythDict[num]
            t?.append(temp)
            pythDict[num] = t
        }
        i+=1
    }
}
for i in pythDict {
    if i.value.count == 1 {
        count+=1
    }
}
//for i in pythDict.sorted(by: { $0.key < $1.key }) {
//    for j in i.value {
//        print(i.key, j)
//    }
//}
print(count)
