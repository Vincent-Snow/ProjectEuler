//
//  main.swift
//  MaximumSumPathII67
//
//  Created by Vincent Snow on 9/28/22.
//

import Foundation

let testInput = """
3
7 4
2 4 6
8 5 9 3
"""


let testInput2 = """
75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
"""
let format = testInput2.split(separator: "\n")
var path: [[Int]] = []
for i in format {
    let split = i.split(separator: " ")
    var temp: [Int] = []
    for x in split {
        temp.append(Int(x)!)
    }
    path.append(temp)
}
let a = [[1,2]]
let b = [[3,4,6]]


func all_paths(_ r: Int, _ c: Int) -> [[Int]] {
    let current = path[r][c]
    if r < path.count - 1 {
        let below_paths = all_paths(r+1, c) + all_paths(r+1, c+1)
        var ps: [[Int]] = []
        for route in below_paths {
            ps.append([current] + route)
        }
        return ps
    } else {
        return [[current]]
    }
}
let all = all_paths(0, 0)
print(all.count)
for i in all {
    print(i)
}
var sum = 0
var avg = 0
for i in path {
    avg+=i.count
    for j in i {
        sum+=j
    }
}
print(sum,avg,sum/avg)
//print(path)
var p:Int
var inc = 0
var s = 10000
var initial: [Int]
while s > 4000 {
    s=0
    p=0
    initial=[]
    for _ in 1...path.count {
        initial.append(p)
        let r = Int(arc4random_uniform(2))
        p+=r
    }
    
    for ind in 0..<initial.count {
        s+=path[ind][initial[ind]]
    }
    //print(s)
    inc+=1
}
print(inc,s)
var finalArr: [Int] = []
var incArr: [Int] = []
for i in path {
    finalArr.append(i.count-1)
}
for _ in 1...path.count {
    incArr.append(0)
}
var asdf = 1
var highest = 0

incLoop: while incArr != finalArr {
    let average = highest/incArr.count
    var sub = 0
    
    
    
    
    for ind in 0..<incArr.count {
        sub+=path[ind][incArr[ind]]
    }
    if sub > highest {
        highest = sub
        print(highest)
    }
}



let stri = stride(from: finalArr.count-1, through: 0, by: -1)
incLoop: while incArr != finalArr {
    var count = 0
    xLoop: for x in stri {
        if x != 0 {
            
            if incArr[x] != incArr[x-1] && incArr[x-1] != incArr[x-2] {  // all three different
                continue xLoop
            }
            
            if incArr[x] == incArr[x-1] { // last two same
                incArr[x]+=1
                break xLoop
            }
            
            if incArr[x-1] == incArr[x-2] { // first two same, last two different
                
                for i in x-1..<finalArr.count {
                    incArr[i] = incArr[x]
                }
                break xLoop
            }
        }
    }
    
    var arr: [Int] = []
    print(incArr)
    asdf+=1
    for simulInd in 0..<path.count {
        let maxLeft = (path.count-1-simulInd)*(9)
        let pathInd = incArr[simulInd]
        let pathIncArr = path[simulInd]
        count+=pathIncArr[pathInd]


        arr.append(pathIncArr[pathInd])
        if maxLeft+count < highest {
            if incArr[simulInd] == finalArr[simulInd] {
                break incLoop
            }
            if incArr[simulInd-1] == incArr[simulInd] {
                incArr[simulInd]+=1
                continue incLoop
            }
            let stri2 = stride(from: simulInd, through: 1, by: -1)
            stri2Loop: for i in stri2 {

                if incArr[i-1] != incArr[i]-1 {
                    for j in i-1..<finalArr.count {
                        incArr[j] = incArr[i]
                    }
                    break stri2Loop
                }
            }
            continue incLoop
        }
    }

    if count > highest {
        highest = count
        //print("highest: ", highest, arr)
    }


    
    

}
print(asdf)



//let stri = stride(from: finalArr.count-1, through: 0, by: -1)
//while incArr != finalArr {
//    var count = 0
//    xLoop: for x in stri {
//        if x != 0 {
//
//            if incArr[x] != incArr[x-1] && incArr[x-1] != incArr[x-2] {  // all three different
//                continue xLoop
//            }
//
//            if incArr[x] == incArr[x-1] { // last two same
//                incArr[x]+=1
//                break xLoop
//            }
//
//            if incArr[x-1] == incArr[x-2] { // first two same, last two different
//                for i in x-1..<finalArr.count {
//                    incArr[i] = incArr[x]
//                }
//                break xLoop
//            }
//        }
//    }
//    print(incArr)
//}

//    for simulInd in 0..<path.count {
//        let pathInd = incArr[simulInd]
//        let pathIncArr = path[simulInd]
//        count+=pathIncArr[pathInd]
//        arr.append(pathIncArr[pathInd])
//    }
//func all_paths(_ r: Int, _ c: Int) -> [[Int]] {
//    let current = path[r][c]
//    if r < path.count - 1 {
//        let below_paths = all_paths(r+1, c) + all_paths(r+1, c+1)
//        var ps: [[Int]] = []
//        for route in below_paths {
//            ps.append([current] + route)
//        }
//        return ps
//    } else {
//        return [[current]]
//    }
//}
