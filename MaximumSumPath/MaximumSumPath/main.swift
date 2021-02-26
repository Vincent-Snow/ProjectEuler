//
//  main.swift
//  MaximumSumPath
//
//  Created by Vincent Snow on 12/23/20.
//

import Foundation
import Algorithms

var testInput = """
3
7 4
2 4 6
8 5 9 3
"""

var highestSumPath: (Int,[Int]) = (0,[])
var sumPath: (Int,[Int]) = (0,[])
var triang = input.components(separatedBy: "\n")
var ind = 0

func distinctPerms(_ strInput: [Int]) -> [[Int]] {
    
    var str = strInput
    var perms: [[Int]] = []
    func shouldSwap(_ start: Int,_ curr: Int) -> Bool {
            for i in start..<curr {
                if (str[i] == str[curr]) {
                    return false;
                }
            }
            return true;
        }
     
    // Prints all distinct permutations in str[0..n-1]
    func findPermutations(_ index: Int,_ n: Int) {
        
            if (index >= n) {
                //print(str)
                perms.append(str);
                return;
            }
     
            for i in index..<n { // (int i = index; i < n; i++) {
     
                // Proceed further for str[i] only if it
                // doesn't match with any of the characters
                // after str[index]
                let check: Bool  = shouldSwap(index, i);
                if (check) {
                    swap(index, i)
                    findPermutations(index + 1, n);
                    swap(index, i)
                }
            }
        }
     
    func swap(_ i: Int,_ j: Int) {
            let c = str[i]
            str[i] = str[j]
            str[j] = c
        }
    let n = str.count
    findPermutations(0, n);
    return perms
}
let r = [[0,0,0,0,0,0,0,0,0,0,0,0,0,1],
         [0,0,0,0,0,0,0,0,0,0,0,0,1,1],
         [0,0,0,0,0,0,0,0,0,0,0,1,1,1],
         [0,0,0,0,0,0,0,0,0,0,1,1,1,1],
         [0,0,0,0,0,0,0,0,0,1,1,1,1,1],
         [0,0,0,0,0,0,0,0,1,1,1,1,1,1],
         [0,0,0,0,0,0,0,1,1,1,1,1,1,1],
         [0,0,0,0,0,0,1,1,1,1,1,1,1,1],
         [0,0,0,0,0,1,1,1,1,1,1,1,1,1],
         [0,0,0,0,1,1,1,1,1,1,1,1,1,1],
         [0,0,0,1,1,1,1,1,1,1,1,1,1,1],
         [0,0,1,1,1,1,1,1,1,1,1,1,1,1],
         [0,1,1,1,1,1,1,1,1,1,1,1,1,1],
         [1,1,1,1,1,1,1,1,1,1,1,1,1,1]]

for x in r {
    for perm in distinctPerms(x) {
        var ind = 0
        var sumPath: (Int,[Int]) = (0,[])
        for i in 0..<triang.count {
            let nums = triang[i].components(separatedBy: " ")
            
            if i > 0 {
                ind+=perm[i-1]
            }
            sumPath.0+=Int(nums[ind])!
            sumPath.1.append(Int(nums[ind])!)
        }
        print(sumPath)
        if sumPath.0 > highestSumPath.0 {
            highestSumPath = sumPath
        }
    }
}

print(highestSumPath)
