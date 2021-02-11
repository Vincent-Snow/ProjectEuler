//
//  main.swift
//  Cubic Permutations
//
//  Created by Vincent Snow on 2/10/21.
//
/*The cube, 41063625 (3453), can be permuted to produce two other cubes: 56623104 (3843) and 66430125 (4053). In fact, 41063625 is the smallest cube which has exactly three permutations of its digits which are also cube.
 
 Find the smallest cube for which exactly five permutations of its digits are cube.*/

import Foundation
import Algorithms

var cubes: [Int] = []
var cubeDict: [Int:Bool] = [:]

for i in 5...1000 {
    let cu = Int(pow(Double(i), 3.0))
    cubes.append(cu)
    cubeDict[cu] = true
}

for i in cubes {
    let str = String(i)
    var pCubeArr: [Int] = [i]
    for j in str.permutations(ofCount: str.count) {
        let p = Int(String(j))!
        
        if p != i && i % 1000 != 0 && cubeDict[p] == true && !pCubeArr.contains(p) && (j[j.count-1] != "0" && j[j.count-2] != "0" && j[j.count-3] != "0"){
            pCubeArr.append(p)
            print(p,i)
        }
        if pCubeArr.count >= 3 {
            print(pCubeArr)
            
        }
    }
}
//for i in cubes {
//    print(i)
//}
