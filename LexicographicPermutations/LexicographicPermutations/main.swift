//
//  main.swift
//  LexicographicPermutations
//
//  Created by Vincent Snow on 1/3/21.
//

import Foundation

func factorial(a: Int) -> Int {
    let n = a
    if(n == 1){
      return 1
    }else{
        return n*factorial(a:n-1)
    }
}
let start = Date()
var factDict: [Int:Int] = [:]
var factCount: [Int:Int] = [:]
var perm = [1,2,3,4,5,6,7,8,9,0]
var perm2 = [0,1,2]
var finalPerm: [Int] = []
var index = 3265920-1

for i in 1...perm.count {
    factDict[i] = factorial(a: i)
}

while index > 0 {
    let max = factDict.keys.max()!
    if index - factDict[max]! < 0 {
        factCount[max-1] = 0
        let dictIndex = factDict.index(forKey: max)
        factDict.remove(at: dictIndex!)
    } else {
        index-=factDict[max]!
        factCount[max]!+=1
        //print(index, factDict[max]!)
    }
}

for i in 0...perm.count-1 {
    if factCount[i] == nil {
        factCount[i] = 0
    }
}
//
//for i in factCount.sorted(by: {$0.key > $1.key}) {
//    print(i)
//}

for i in factCount.sorted(by: {$0.key > $1.key}) {
    finalPerm.append(perm[i.value])
    perm.remove(at: i.value)
}
print(finalPerm, Date().timeIntervalSince(start))
