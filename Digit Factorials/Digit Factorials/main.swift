//
//  main.swift
//  Digit Factorials
//
//  Created by Vincent Snow on 1/7/21.
//

import Foundation
let start = Date()
var total = 0
func factorial(_ a: Int) -> Int {
    let n = a
    if n == 1 || n == 0 {
      return 1
    }else{
        return n*factorial(n-1)
    }
}

for i in 10...50000 {
    let stri = String(i)
    var sum = 0
    for j in stri {
        sum+=factorial(Int(String(j))!)
    }
    if sum == i {
        for j in stri {
            print(j, factorial(Int(String(j))!))
        }
        total+=sum
        print(i)
    }
}
print(total, Date().timeIntervalSince(start))
