//
//  main.swift
//  Integer Right Triangles
//
//  Created by Vincent Snow on 1/15/21.
//

import Foundation
let start = Date()

let hasher: [Int:Int] = [:]
var pyth: [(Int,Int,Int)] = []
var uniq: [Int:Int] = [:]
var loopTill = 1000
var loopsq = loopTill * loopTill
var prevSq = 0
//for i in 1...loopTill {
//    hasher[i] = i*i
//}

//for i in 1...100 {
//    var sq = i*i
//    print(sq, prevSq, sq - prevSq)
//    prevSq = sq
//}

aLoop: for a in 1...loopTill {
    let asq = a*a
    let half = sqrt(Double(loopsq/2))
    if half < Double(a) {
        break
    }
    bLoop: for b in a+1...loopTill {
        let bsq = b*b
        if asq + bsq > loopsq {
            continue bLoop
        }
        //print(a,b)
        cLoop: for c in b+1...loopTill {
            let csq = c*c
            if c - b > asq {
                continue aLoop
            }
            if a + b < c {
                continue bLoop
            }
            if asq + bsq < csq {
                continue bLoop
            }

            if asq + bsq == csq {
                print((a, b, c), (asq,bsq,csq))
//                pyth.append((a,b,c))
                if a+b+c < loopTill {
                    if uniq[a+b+c] == nil {
                        uniq[a+b+c] = 1
                    } else {
                        uniq[a+b+c]!+=1
                    }
                }
                if c-b == 1 {
                    continue aLoop
                }
            }
        }
    }
}
for i in uniq.sorted(by: { $0.value > $1.value }) {
    print(i)
    break
}
print(uniq.values.max()!, uniq.count, Date().timeIntervalSince(start))
