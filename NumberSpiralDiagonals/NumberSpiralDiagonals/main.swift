//
//  main.swift
//  NumberSpiralDiagonals
//
//  Created by Vincent Snow on 1/6/21.
//

import Foundation
var sum = 0;var sum2 = 0;var addBy = 2;var next = 1;let start = Date()
for i in 1...1001 {
    if i % 2 != 0 {
        sum+=i*i
    } else {
        sum+=(i*i)+1
    }
}
for _ in 1...1000 {
    next+=addBy
    addBy+=2
    sum2+=next
}
print(sum, sum2, sum+sum2, Date().timeIntervalSince(start))
