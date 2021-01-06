//
//  main.swift
//  Su Doku
//
//  Created by Vincent Snow on 1/5/21.
//

import Foundation

let tester = ["1","2","3","4","5","6","7","8","9"]
var updatedPuzzle: [String] = []
let first = onePuzzle.components(separatedBy: "\n")
for i in first {
    var row = i
    indexLoop: for index in 0..<row.count {
        let str = String(row[index])
        if str == "0" {
            testerLoop: for x in tester {
                if row.contains(x) {
                    continue testerLoop
                } else {
                    let index0 = row.firstIndex(of: Character(str))!
                    row.remove(at: index0)
                    row.insert(contentsOf: x, at: index0)
                    continue indexLoop
                }
            }
        }
    }
    updatedPuzzle.append(row)
}

for i in updatedPuzzle {
    print(i)
}


print(updatedPuzzle.joined())
