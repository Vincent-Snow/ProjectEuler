//
//  main.swift
//  LatticePaths
//
//  Created by Vincent Snow on 12/22/20.
//

import Foundation

var row = 0
var col = 0
var path: Set<[[Int]]> = []
var paths: [[Int]] = []
var outerTest: [[Int]] = []
var innerTest: [Int] = []
var square = 4

for _ in 1...square {
    innerTest.append(0)
}
for _ in 1...square {
    outerTest.append(innerTest)
}
for i in outerTest {
    print(i)
}

for _ in 1...924 {
    row = 0; col = 0; paths = [];
    paths.append([row,col])
    for _ in 1...((square-1)*2) {
        while row <= square-1 {
            while col <= square-1 {
                if row == outerTest.count-1 {
                    col+=1
                } else if col == outerTest[row].count-1 {
                    row+=1
                }
                
                if true {
                    row+=1
                    
                } else {
                    col+=1

                }
            }
        }
        paths.append([row,col])
    }
    path.insert(paths)
}
for i in path {
    print(i)
}
print(path.count)

for _ in 1...924 {
    row = 0; col = 0; paths = [];
    paths.append([row,col])
    for _ in 1...((square-1)*2) {
        let random = Bool.random()
        //print(random)
        if row == outerTest.count-1 {
            col+=1
            
        } else if col == outerTest[row].count-1 {
            row+=1
            
        } else if random {
            row+=1
            
        } else {
            col+=1

        }
        paths.append([row,col])
    }
    path.insert(paths)
}
